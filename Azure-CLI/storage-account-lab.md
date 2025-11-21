# Azure CLI Lab- Creating a Storage Account

## Step 1: Prerequisite – Resource Group
Make sure you already created a Resource Group:

az group create --name MyResourceGroup --location eastus


## Step 2: Create a Storage Account
The storage account name must be globally unique.

az storage account create \
  --name mystorage$RANDOM \
  --resource-group MyResourceGroup \
  --location eastus \
  --sku Standard_LRS \
  --kind StorageV2


## Step 3: List Storage Accounts
az storage account list --resource-group MyResourceGroup --output table


## Step 4: Show Details of Storage Account
az storage account show \
  --name mystorage$RANDOM \
  --resource-group MyResourceGroup \
  --output json

