# Description

This repository is an example to add a "DoNotDelete"-Lock for every Azure Resource Group in a subscription via Terraform, the azurerm provider and Azure CLI.  
Additionally it will exclude a specific resource group from the lock which you can configue in the variables file.

## How to run

```sh
terraform init -reconfigure -upgrade
terraform plan -no-color -out "tf-app.plan"
terraform apply -auto-approve -no-color "tf-app.plan"
```