# Docker Volumes and Bind Mounts (Persistent Storage)

## Objective
Understand why container data is lost by default (ephemeral filesystem) and how to persist data using:
- **Docker Volumes** (recommended for production)
- **Bind Mounts** (recommended for local development)

---

## Key Concepts (Beginner Friendly)
### Why containers lose data
A container’s writable filesystem exists only for the lifetime of that container. When the container is removed, its writable layer is removed too.

### Docker Volume
A **Docker-managed** storage location that lives **outside** the container lifecycle.  
✅ Best for production workloads.

### Bind Mount
A direct mapping between a **host folder path** and a container path.  
✅ Best for development (live editing, local testing).  
⚠️ Risky in production if misused because the container can modify host files.

---

## LAB-1: Ephemeral Container Filesystem (Data Loss)

In this lab, we prove that data written inside a container is lost once the container is removed.

### Steps
1. Started an Ubuntu container.
2. Created a file inside `/app`.
3. Removed the container.
4. Started a new container and attempted to read the file.

### Result
The file was missing after container recreation, proving that the container filesystem is ephemeral.

**Evidence:**  
![](./screenshots/lab1-ephemeral-data-created.png)  
![](./screenshots/lab1-ephemeral-data-lost.png)

## LAB-2: Docker Volume demo (Persistent Storage)
Goal

Persist data beyond the container lifecycle using a Docker-managed volume.

Steps + Commands
1) Create a Docker volume
docker volume create volumes-docker
docker volume ls

2) Run container with volume mounted at /app
docker run -it --name docker-volume-test -v volumes-docker:/app ubuntu

3) Write and verify data inside the mounted path
echo "This data is persisted using Docker Volume" > /app/volume.txt
ls /app
cat /app/volume.txt
exit

4) Remove the container (simulate replacement/redeploy)
docker rm docker-volume-test

5) Reattach the same volume to a new container and verify persistence
docker run -it --name docker-volume-verify -v volumes-docker:/app ubuntu

cat /app/volume.txt
exit

6) Inspect volume details (optional but good evidence)
docker volume inspect volumes-docker

Result

Data persisted after deleting and recreating the container, proving Docker Volumes provide persistent storage.


## LAB-3: Bind Mount demo (Development Workflow)
Goal

Mount a real host folder into the container and show container ↔ host file sync.

Steps + Commands
1) Create host folder (Windows)
mkdir C:\devops-bind

2) Run container with bind mount (host → container)
docker run -it --name docker-bind-test -v C:\devops-bind:/data ubuntu

3) Create file inside container and verify it
echo "Hello from bind mount" > /data/bind.txt
ls -l /data
cat /data/bind.txt
exit

4) Verify the file exists on the host
type C:\devops-bind\bind.txt

Result

The file created inside the container is immediately available on the host filesystem, proving bind mounts provide live syncing.