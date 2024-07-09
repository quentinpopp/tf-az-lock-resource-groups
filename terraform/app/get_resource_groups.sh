#!/bin/bash

# Login to Azure
az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID --output none
az account set --subscription $1

#Fetch the resource groups
resource_groups=$(az group list --query '[]' --output json)

# Prepare the JSON output for Terraform (Map of key-value pairs as string:string)
echo $resource_groups | jq -c 'map({ (.name): (.id | tostring) }) | add'