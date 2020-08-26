terraform {
  required_version = "~> 0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.24.0"
    }
  }
}

provider "azurerm" {
  # the features block is mandatory, even if empty
  features {}

  tenant_id        = var.tenant_id
  subscription_id  = var.subscription_id

  client_id        = var.client_id
  client_secret    = var.client_secret
}

module "resGroup" {
  source   = "./modules/tf_resGroup"
  name     = "tf_resGroup"
  location = "West Europe"
}

module "linuxservers" {
  source              = "Azure/compute/azurerm"
  version             = "3.5.0"
  resource_group_name = module.resGroup.name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["linsimplevmips"]
  vnet_subnet_id      = module.network.vnet_subnets[0]
  depends_on          = [module.resGroup]
}

module "windowsservers" {
  source              = "Azure/compute/azurerm"
  version             = "3.5.0"
  resource_group_name = module.resGroup.name
  is_windows_image    = true
//  vm_hostname         = "mywinvm"
  vm_hostname         = chomp("mywinvm\r\n\n\n")
  admin_password      = "ComplxP@ssw0rd!"
  vm_os_simple        = "WindowsServer"
//  public_ip_dns       = ["winsimplevmips"]
  public_ip_dns       = [strrev("winsimplevmips")]
  vnet_subnet_id      = module.network.vnet_subnets[0]
  depends_on          = [module.resGroup]
}

module "network" {
  source              = "Azure/network/azurerm"
  version             = "3.1.1"
  resource_group_name = module.resGroup.name
  address_space       = "10.0.0.0/16"
//  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_prefixes     = [cidrsubnet("10.0.0.0/16", 8, 1), cidrsubnet("10.0.0.0/16", 8, 2), cidrsubnet("10.0.0.0/16", 8, 3)]
//  subnet_names        = ["subnet1", "subnet2", "subnet3"]
  subnet_names        = split(",", "subnet1,subnet2,subnet3")
  depends_on          = [module.resGroup]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}

output "linux_vm_public_name" {
  value = module.linuxservers.public_ip_dns_name
}

output "windows_vm_public_name" {
  value = module.windowsservers.public_ip_dns_name
}
