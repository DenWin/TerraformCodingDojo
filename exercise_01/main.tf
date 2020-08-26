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

data "azurerm_client_config" "current" { } # the data block is only required to verify the connectivity to Azure

locals {
    concat_str = "${var.client_secret}_YYY_${data.azurerm_client_config.current.client_id}"
    some_parameter = {
       sub_param = "Hello, %{ if var.client_secret != "" }${var.client_secret}%{ else }world%{ endif }!"
    }
}

output "concat_str" {
  value = local.concat_str
}

output "A" {
  value = local.some_parameter.sub_param
}
