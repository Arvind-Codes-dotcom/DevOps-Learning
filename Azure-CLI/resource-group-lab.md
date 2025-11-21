# Azure CLI Lab – Create a Resource Group

## Step 1: Login to Azure
az login --use-device-code


## Step 2: Set your subscription (optional)
az account set --subscription "YOUR-SUBSCRIPTION-ID"


## Step 3: Create a Resource Group
az group create --name MyResourceGroup --location eastus


## Step 4: Verify the Resource Group
az group list --output table
