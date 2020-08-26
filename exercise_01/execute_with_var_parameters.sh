#!/bin/bash

# Use your own tenant_id, subscription_id, client_id and client_secret.
terraform plan -var="tenant_id=dec58247-1dd1-42b2-af3a-ca863318c424"       \
               -var="subscription_id=84c5c22e-f0e6-4b99-99bb-98990facc06f" \
               -var="client_id=dc046487-62ac-4524-bf67-85f0a50049d1"       \
               -var="client_secret=client_secret"
