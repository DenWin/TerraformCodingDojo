#!/bin/bash

# Use your own tenant_id, subscription_id, client_id and client_secret.
if [[ -f terraform.tfvars ]]; then
    MV_TERRAFORM_TFVARS=yes
    mv terraform.tfvars azurerm.tfvars
fi

terraform plan -var-file="azurerm.tfvars"

if [[ MV_TERRAFORM_TFVARS==yes ]]; then
    mv azurerm.tfvars terraform.tfvars
fi
