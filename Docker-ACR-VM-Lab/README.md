# Docker Image Push to Azure Container Registry (ACR) using Ubuntu VM

## 📌 Objective

To build a Java application inside a Docker container on an Ubuntu VM and push the image to Azure Container Registry (ACR).

---

## 🏗 Architecture Overview

Ubuntu VM (Build Server)
        ↓
Docker Build
        ↓
Tag Image
        ↓
Push to Azure Container Registry (ACR)

---

## 🛠 Technologies Used

- Ubuntu Server (Azure VM)
- Docker
- Azure CLI
- Azure Container Registry (ACR)
- Java (OpenJDK 17)

---

## 🔹 Step 1: Create ACR

- Created ACR in resource group `rg-acr`
- Enabled Admin user
- Used Basic SKU

---

## 🔹 Step 2: Create Ubuntu VM

- 2 vCPU configuration
- SSH enabled
- Used as Docker build server

---

## 🔹 Step 3: Install Docker

```bash
sudo apt update
sudo apt install docker.io -y
sudo systemctl enable --now docker

## 🔹 Step 4: Install Azure CLI
sudo apt install azure-cli -y
az login --use-device-code

##🔹 Step 5: Build Java Docker Image
docker build -t java-login-app .

##🔹 Step 6: Tag Image for ACR
docker tag java-login-app <acr-name>.azurecr.io/java-login-app:v1

##🔹 Step 7: Push Image to ACR
docker push <acr-name>.azurecr.io/java-login-app:v1

##🔹 Verification

Verified image in Azure Portal under ACR → Repositories

Confirmed tag v1 exists

🔹 Cleanup (Cost Optimization)

Deleted VM resource group:

az group delete --name rg-acr-lab --yes --no-wait


ACR retained for future Kubernetes deployment.

🎯 Key Learnings

Docker build context importance

Linux case sensitivity

Image tagging strategy

Registry authentication using Azure CLI

Resource Group deletion boundaries

Cloud cost awareness