# Deployments & ReplicaSets

## Architecture Relationship

Deployment
    ↓
ReplicaSet
    ↓
Pods

---

## ReplicaSet

Ensures specified number of replicas are running.

Example:
replicas: 3

If one pod crashes → ReplicaSet creates new pod.

---

## Deployment

Provides:
- Rolling updates
- Rollbacks
- Version history
- Scaling

---

## Rolling Update Flow

1. Deployment detects image change
2. New ReplicaSet created
3. New pods started gradually
4. Old pods terminated gradually
5. Zero downtime achieved

---

## Scaling

kubectl scale deployment <name> --replicas=5