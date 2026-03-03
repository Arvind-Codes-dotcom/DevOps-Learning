# Kubernetes Cluster Provisioning (KOPS)

## What is KOPS?

KOPS (Kubernetes Operations) is a tool used to create and manage Kubernetes clusters.

It provisions:
- VMs
- Control Plane components
- etcd
- Networking
- Worker nodes

---

## Cluster Creation Flow

1. Create virtual machines
2. Install control plane components
3. Configure etcd
4. Install kubelet on worker nodes
5. Join worker nodes to cluster
6. Configure networking & DNS

---

## KOPS vs AKS

| Feature | KOPS | AKS |
|----------|------|------|
| Control Plane | User Managed | Azure Managed |
| etcd Backup | User Managed | Azure Managed |
| Upgrades | User Managed | Azure Managed |

AKS simplifies cluster management by managing control plane.