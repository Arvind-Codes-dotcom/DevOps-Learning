# Kubernetes Pods

## What is a Pod?

A Pod is the smallest deployable unit in Kubernetes.

It encapsulates:
- One or more containers
- Shared network
- Shared storage

---

## Pod Diagram

        +-------------------+
        |       Pod         |
        |-------------------|
        | Container 1       |
        | Container 2       |
        | Shared IP         |
        | Shared Volumes    |
        +-------------------+

---

## Important Characteristics

- Pods are ephemeral
- Pod IP changes if recreated
- Pods do NOT self-heal
- Controllers manage Pods

---

## Important Commands

kubectl get pods  
kubectl describe pod <name>  
kubectl logs <pod>  
kubectl exec -it <pod> -- /bin/bash  