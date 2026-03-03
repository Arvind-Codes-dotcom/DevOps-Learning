# Kubernetes Architecture

Kubernetes cluster has two main components:

1. Control Plane (Brain)
2. Data Plane (Worker Nodes)

---

## High-Level Diagram

                +----------------------+
                |    Control Plane     |
                |----------------------|
                | API Server           |
                | Scheduler            |
                | Controller Manager   |
                | etcd                 |
                | Cloud Controller     |
                +----------+-----------+
                           |
                           |
         ----------------------------------------
         |                                      |
 +---------------+                    +---------------+
 |   Worker Node |                    |   Worker Node |
 |---------------|                    |---------------|
 | kubelet       |                    | kubelet       |
 | kube-proxy    |                    | kube-proxy    |
 | containerd    |                    | containerd    |
 +---------------+                    +---------------+

## Control Plane Components

### API Server

Entry point of cluster.
All kubectl commands go through it.

### etcd

Key-value store that holds cluster state.

### Scheduler

Assigns pods to appropriate nodes.

### Controller Manager

Ensures desired state is maintained.

### Cloud Controller Manager

Integrates Kubernetes with cloud provider (Azure in AKS).

## Data Plane Components

### kubelet

Node agent that runs on every worker node.

### container runtime

Runs containers (containerd / Docker).

### kube-proxy

Handles networking and service routing.