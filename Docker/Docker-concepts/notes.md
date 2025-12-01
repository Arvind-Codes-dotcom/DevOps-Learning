# Docker Zero to Hero – Notes

## 1. What is Docker?
Docker is a containerization platform that helps you:
- Build container images
- Run containers
- Push images to registries
- Deploy applications in a consistent environment

## 2. Docker Architecture
### Docker Client (CLI)
- The command-line interface you use to interact with Docker.

### Docker Daemon (Engine)
- Responsible for running containers, building images.

### Docker Images
- Blueprints or templates used to create containers.

### Registries
- Docker Hub (public)
- Azure Container Registry (private)

## 3. What is a Docker Image?
A read-only template containing:
- Application code
- Required dependencies
- Runtime environment
- Linux base layers

Examples:
- nginx
- ubuntu
- python
- openjdk

## 4. What is a Docker Container?
A running instance of an image — lightweight and isolated.

## 5. Dockerfile Basics
A Dockerfile is used to create custom images.

Example:
FROM openjdk:17
WORKDIR /app
COPY LoginApp.java .
RUN javac LoginApp.java
CMD ["java", "LoginApp"]


## 6. Key Learnings from Day-24 Video
- Difference between images and containers
- Understanding Docker layers
- Dockerfile structure
- Basic Docker commands
- How to run and manage containers
