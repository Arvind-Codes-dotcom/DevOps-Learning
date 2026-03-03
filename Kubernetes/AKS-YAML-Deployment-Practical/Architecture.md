# AKS YAML Architecture and Traffic Flow

## Objects
- Deployment: ensures desired replica count, manages rollout strategy
- Pods: run nginx containers
- Service (LoadBalancer): stable access + triggers Azure LB + Public IP

## Traffic flow
Browser
→ Azure Public IP
→ Azure Load Balancer
→ NodePort
→ Kubernetes Service
→ Pod (nginx container)