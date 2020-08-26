terraform {
  required_version = "0.11.0"
}


provider "azurerm" {
  # the features block is mandatory, even if empty
  features {}
  version = ">=1.4.0"

  tenant_id        = "${var.tenant_id}"
  subscription_id  = "${var.subscription_id}"

  client_id        = "${var.client_id}"
  client_secret    = "${var.client_secret}"
}

data "azurerm_client_config" "current" { } # the data block is only required to verify the connectivity to Azure

locals {
    concat_str = "${var.client_secret}_YYY_${data.azurerm_client_config.current.client_id}"
}

output "concat_str" {
  value = "${local.concat_str}"
}
