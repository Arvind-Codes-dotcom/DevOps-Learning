# AKS Practical – Deploying Nginx on Azure Kubernetes Service (AKS)

## 📌 Objective
To create an AKS cluster in Azure, deploy an Nginx application, expose it using a LoadBalancer service, and access it publicly via browser.

---

## 🏗 Architecture Overview

Internet
    ↓
Azure Public IP
    ↓
Azure Load Balancer
    ↓
NodePort
    ↓
Kubernetes Service (LoadBalancer)
    ↓
Pod (Nginx Container)
    ↓
AKS Node (VM)

---

## 🧱 Step 1 – Create Resource Group

```bash
az group create --name myResourceGroup --location eastus
```

---

## ☸ Step 2 – Create AKS Cluster

```bash
az aks create \
  --resource-group myResourceGroup \
  --name myAKSCluster \
  --node-count 1 \
  --enable-addons monitoring \
  --generate-ssh-keys
```

---

## 🔐 Step 3 – Connect to Cluster

```bash
az aks get-credentials --resource-group myResourceGroup --name myAKSCluster
```

---

## 🚀 Step 4 – Deploy Nginx

```bash
kubectl create deployment nginx-deployment --image=nginx
kubectl get pods
```

---

## 🌍 Step 5 – Expose Using LoadBalancer

```bash
kubectl expose deployment nginx-deployment --port=80 --type=LoadBalancer
kubectl get svc
```

---

## 🧠 What Happens Internally?

- AKS creates a Kubernetes Deployment
- Deployment creates ReplicaSet
- ReplicaSet creates Pod
- Service of type LoadBalancer triggers Azure to create:
  - Azure Load Balancer
  - Public IP
  - NodePort mapping
- Traffic flows from Internet → Public IP → Azure LB → Node → Pod

---

## 🎯 Key Learning Outcomes

- AKS cluster provisioning
- Understanding Deployment vs Pod
- Service types (ClusterIP, NodePort, LoadBalancer)
- Azure Load Balancer integration
- Cloud networking flow in Kubernetes

---

## 🧹 Cleanup

```bash
az group delete --name myResourceGroup --yes --no-wait
```

---

## 💼 Interview Questions Covered

1. What happens when you create a LoadBalancer service in AKS?
2. Difference between Deployment and Pod?
3. How does traffic reach a Kubernetes Pod in AKS?
4. What Azure resources are created when exposing a service?