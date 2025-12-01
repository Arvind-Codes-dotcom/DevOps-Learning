# Building Your First Docker Image – Concepts & Explanation

## 1. Why we need two files (app.py and Dockerfile)
### app.py
This file contains the actual application code. In our case, it is a small Python web application using Flask.

### Dockerfile
This file contains instructions for Docker to build an image that can run the application.  
It defines:
- Base image
- Working directory
- Files to copy
- Dependencies to install
- Command to run the application

The Dockerfile is the "recipe" and app.py is the "ingredients".

---

## 2. What is a Dockerfile?
A Dockerfile is a special text file with **no file extension** that contains instructions on how to build a Docker image.

Docker automatically detects a file named **Dockerfile** during image build.

---

## 3. Understanding the Dockerfile (line-by-line)

### `FROM python:3.9-slim`
Specifies the base image.  
This gives us:
- Python 3.9 installed
- A minimal Linux environment

### `WORKDIR /app`
Sets the working directory inside the container.

### `COPY . .`
Copies all files from the current folder (host) into the container.

### `RUN pip install flask`
Installs the Flask package **inside the image**, not on the host system.

### `EXPOSE 5000`
Documents that the application will run on port 5000.

### `CMD ["python", "app.py"]`
Defines the default command to run when the container starts.

---

## 4. Why containerizing the app is useful
- No need to install Python or Flask on your machine  
- App becomes portable  
- Runs the same on all systems  
- Clean, isolated execution environment  
- Perfect for DevOps CI/CD pipelines  

---

## 5. Summary
- `app.py` = Application logic  
- `Dockerfile` = Instructions to package and run the application  
- `docker build` = Creates a custom image  
- `docker run` = Runs your image as a container  
