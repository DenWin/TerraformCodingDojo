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

  tenant_id       = "00000000-0000-0000-0000-000000000000"
  subscription_id = "00000000-0000-0000-0000-000000000000"

  client_id       = "00000000-0000-0000-0000-000000000000"
  client_secret   = "client_secret"
}

data "azurerm_client_config" "current" {
}

output "client_id" {
  value = data.azurerm_client_config.current.client_id
}

resource "azurerm_resource_group" "tf_resGroup" {
  name     = "tf_resGroup"
  location = "West Europe"
}
