#!/bin/bash

# Use your own tenant_id, subscription_id, client_id and client_secret.
terraform plan -var="tenant_id=00000000-0000-0000-0000-000000000000"       \
               -var="subscription_id=00000000-0000-0000-0000-000000000000" \
               -var="client_id=00000000-0000-0000-0000-000000000000"       \
               -var="client_secret=client_secret"
