# Azure CLI Lab - Creating a Virtual Machine (VM)

## Step 1: Prerequisite – Resource Group
Make sure you already created a Resource Group:
az group create --name MyResourceGroup --location eastus


## Step 2: Create a Virtual Machine
This will create a Windows VM:

az vm create \
  --resource-group MyResourceGroup \
  --name MyVM \
  --image Win2022Datacenter \
  --admin-username azureuser \
  --admin-password MyP@ssw0rd123 \
  --size Standard_B2s


## Step 3: Open RDP Port
az vm open-port --resource-group MyResourceGroup --name MyVM --port 3389


## Step 4: View VM Details
az vm show --resource-group MyResourceGroup --name MyVM --output table


## Step 5: Get Public IP
az vm list-ip-addresses --resource-group MyResourceGroup --name MyVM --output table

