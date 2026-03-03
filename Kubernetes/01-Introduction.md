# Kubernetes - Introduction

## What is Kubernetes?

Kubernetes (K8s) is a container orchestration platform used to automate deployment, scaling, and management of containerized applications.

Docker runs containers.
Kubernetes manages containers across multiple machines.

---

## Why Kubernetes is Needed

Docker Limitations:
- Single-host focus
- No built-in auto-scaling
- No automatic load balancing
- No rolling updates
- No cluster-level management

Kubernetes Solves:
- Auto-healing
- Auto-scaling
- Load balancing
- Rolling updates
- Declarative infrastructure

---

## Declarative Model

Kubernetes follows a declarative model.

Instead of saying:
"Run this container"

We define:
"I want 3 replicas running"

Kubernetes ensures actual state matches desired state.

---

## Desired State & Reconciliation Loop

1. User defines desired state in YAML
2. Kubernetes stores it in etcd
3. Controllers constantly compare actual vs desired state
4. Differences are corrected automatically