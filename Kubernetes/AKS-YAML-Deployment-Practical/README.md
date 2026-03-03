# AKS YAML Deployment – Nginx (Deployment + Service)

## Objective
Deploy Nginx to AKS using the declarative YAML workflow and expose it publicly using a LoadBalancer service.

## What we built
- Deployment (nginx-yaml) with 2 replicas
- Service (nginx-yaml-svc) type LoadBalancer
- Verified public access via Azure Public IP
- Practiced scaling and rolling updates

## Commands used
```bash
kubectl apply -f manifests/deployment.yaml
kubectl apply -f manifests/service.yaml

kubectl get deploy
kubectl get pods -o wide
kubectl get svc nginx-yaml-svc

kubectl scale deployment nginx-yaml --replicas=3
kubectl set image deployment/nginx-yaml nginx=nginx:1.27
kubectl rollout status deployment/nginx-yaml