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

data "azurerm_client_config" "current" {
}

output "client_id" {
  value = data.azurerm_client_config.current.client_id
}

resource "azurerm_resource_group" "ABC" {
  name     = "ABC"
  location = "West Europe"
}
