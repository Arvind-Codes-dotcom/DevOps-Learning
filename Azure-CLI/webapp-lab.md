# Azure CLI Lab – Create a Web App (App Service)

## Step 1: Prerequisite – Resource Group
Make sure the resource group exists:

az group create --name MyResourceGroup --location eastus


## Step 2: Create an App Service Plan
This defines the compute resources for your Web App.

az appservice plan create \
  --name MyAppServicePlan \
  --resource-group MyResourceGroup \
  --sku B1 \
  --location eastus


## Step 3: Create the Web App
az webapp create \
  --name my-webapp-$RANDOM \
  --resource-group MyResourceGroup \
  --plan MyAppServicePlan \
  --runtime "NODE:18-lts"


## Step 4: List All Web Apps
az webapp list --output table


## Step 5: Get Web App URL
az webapp show \
  --name my-webapp-$RANDOM \
  --resource-group MyResourceGroup \
  --query defaultHostName


## Step 6: Browse the Web App
Copy the URL into a browser:

https://<your-webapp-name>.azurewebsites.net

