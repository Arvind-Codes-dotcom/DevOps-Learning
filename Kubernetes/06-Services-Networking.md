# Kubernetes Services & Networking

## Why Services?

Pods are ephemeral and their IP changes.

Service provides:
- Stable IP
- DNS name
- Load balancing

---

## Service Types

### ClusterIP
Internal communication only.

### NodePort
Exposes service on node IP + static port.

### LoadBalancer
Creates external cloud load balancer (AKS uses Azure LB).

---

## Traffic Flow (LoadBalancer in AKS)

User
  ↓
Azure Load Balancer
  ↓
Node
  ↓
kube-proxy
  ↓
Service
  ↓
Pod

---

## Label Matching

Deployment:

labels:
  app: nginx

Service:

selector:
  app: nginx

Labels must match for traffic routing.