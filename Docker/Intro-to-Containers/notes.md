# Introduction to Containers – Notes

## 1. What is a Container?
A container is a lightweight, isolated environment that packages:
- Application code
- Dependencies
- Libraries
- Configuration

Containers share the host OS kernel and start within seconds.

## 2. Virtual Machines vs Containers
### Virtual Machines:
- Heavy (each VM has its own full OS)
- Slow startup
- High resource usage

### Containers:
- Lightweight (share host OS kernel)
- Fast startup (seconds)
- Ideal for microservices

## 3. Why Containers Are Needed
- Consistent environment across Dev → QA → Prod
- Eliminates "works on my machine" issues
- Easy scaling
- Fast deployments
- Perfect for microservices architecture

## 4. Microservices & Containers
Each microservice runs in its own container:
- Isolated
- Scalable
- Deployable independently

## 5. Container Lifecycle
1. Build
2. Run
3. Stop
4. Restart
5. Destroy

## 6. Key Takeaways from Day-23 Video
- Understanding container fundamentals
- Difference between VMs and containers
- Why companies use containers
- How containerization solves dependency issues
