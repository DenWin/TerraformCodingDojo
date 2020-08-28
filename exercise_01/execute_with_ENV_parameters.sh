#!/bin/bash

# Use your own tenant_id, subscription_id, client_id and client_secret.
export TF_VAR_tenant_id="00000000-0000-0000-0000-000000000000"
export TF_VAR_subscription_id="00000000-0000-0000-0000-000000000000"
export TF_VAR_client_id="00000000-0000-0000-0000-000000000000"
export TF_VAR_client_secret="client_secret"

terraform plan

unset TF_VAR_tenant_id TF_VAR_subscription_id TF_VAR_client_id TF_VAR_client_secret
