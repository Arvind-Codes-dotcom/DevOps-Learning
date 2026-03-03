# AKS Architecture Deep Dive

## Components Created

1. Azure Resource Group
2. AKS Control Plane (Managed by Azure)
3. Worker Node (VM)
4. Kubernetes Deployment
5. ReplicaSet
6. Pod (Nginx Container)
7. Service (LoadBalancer)
8. Azure Load Balancer
9. Public IP

---

## Traffic Flow Explained

Client Browser
    ↓
Public IP (Azure)
    ↓
Azure Load Balancer
    ↓
NodePort (exposed port on node)
    ↓
ClusterIP Service
    ↓
Pod (Nginx Container)

---

## Why Nginx?

- Lightweight
- Fast startup
- No configuration required
- Standard web server
- Common for Kubernetes demos

---

## Why We Used Imperative Commands?

Used for:
- Quick testing
- Learning
- Simplicity

In production:
- YAML files
- GitOps
- CI/CD pipelines