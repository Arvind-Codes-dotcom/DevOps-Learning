# Docker Networking (Bridge vs Custom Bridge)

## Objective
Understand Docker networking behavior and why custom bridge networks are required for
container-to-container communication using service names.

---

## Key Concepts

### Default Bridge Network
- Containers get IPs
- No DNS-based name resolution
- Containers cannot reach each other using names
- Requires IP-based communication

### Custom Bridge Network
- User-defined network
- Built-in Docker DNS
- Containers can communicate using container names
- Recommended for production-like setups

---

## LAB-1: Default Bridge Network (Name Resolution Failure)

### Step 1: List Docker networks
```powershell
docker network ls

### Step 2: Run container on default bridge
docker run -it --name Login busybox

Inside container:

ping -c 2 Logout
ping -c 2 Finance
exit

Result

Name resolution fails because default bridge does not provide Docker DNS.

## LAB-2: Custom Bridge Network (Name Resolution Works)

### Step 3: Create custom network
docker network create devops-net
docker network ls

### Step 4: 
docker run -it --name Login --network devops-net busybox

Inside container:

ping -c 2 Logout
ping -c 2 Finance


(Expected to fail until other containers start)

### Step 5: Run Logout container
docker run -it --name Logout --network devops-net busybox


Inside container:

ping -c 2 Login
ping -c 2 Finance
exit

### Step 6: Run Finance container
docker run -it --name Finance --network devops-net busybox


Inside container:

ping -c 2 Login
ping -c 2 Logout
exit

### Step 7: Verify network configuration
docker network inspect devops-net

Result:

All containers can resolve each other by name using Docker DNS.

| Network Type   | Name Resolution | Use Case                          |
| -------------- | --------------- | --------------------------------- |
| Default bridge | ❌ No            | Basic / legacy                    |
| Custom bridge  | ✅ Yes           | Production                        |
| Host           | N/A             | Performance-critical (Linux only) |


### Cleanup
docker rm -f Login Logout Finance
docker network rm devops-net


## DevOps Notes

Docker custom bridge networking maps directly to Kubernetes Pod networking

Service discovery in Docker = DNS

This is foundational for microservices and Kubernetes Services