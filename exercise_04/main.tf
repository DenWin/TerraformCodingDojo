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


resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_wan" "example" {
  name                = "example-virtualwan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

resource "azurerm_virtual_hub" "example" {
  count               = var.enabled ? 1 : 0
  name                = var.hub_names
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  virtual_wan_id      = azurerm_virtual_wan.example.id
  address_prefix      = "10.0.1.0/24"

  dynamic "route" {
    for_each = local.routes

    content {
      address_prefixes    = route.value.address_prefixes
      next_hop_ip_address = route.value.next_hop_ip_address
    }
  }
}

module "users" {
  for_each    = var.user-types
  source      = "./modules/user"
  group       = each.value.group
  users       = each.value.users
}

output "route-block" {
  value = azurerm_virtual_hub.example[0].route
}

output "routes_address_prefixes" {
  value = azurerm_virtual_hub.example[0].route[*].address_prefixes
}
