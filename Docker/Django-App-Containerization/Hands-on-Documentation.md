# Django Application Containerization (Docker)

## 📌 Introduction
This module demonstrates how to containerize a real Django web application using Docker. It follows the workflow with best‑practice DevOps structure, clear explanations, and a Docker Hub push for your portfolio.

You will find:
- Full explanation of concepts
- Hands‑on commands with outputs
- Project structure
- Dockerfile
- Image build logs
- Container run logs
- Browser screenshots (placeholder)
- Docker Hub push logs

---

# 🧠 Concepts Covered

## ✔ What is Django?
A high‑level Python web framework used in real applications: admin portals, dashboards, APIs, e‑commerce, etc.

## ✔ Why containerize Django?
- You don’t need Python installed on production servers
- Environment stays consistent
- Deployment becomes repeatable
- Works perfectly with Kubernetes
- Easy to run on cloud platforms

## ✔ Dockerfile Purpose
A Dockerfile describes:
- Which base image to use
- What dependencies to install
- How to copy your project
- Which port to expose
- How to run the application

This makes your Django app fully portable.

---

# 📂 Project Structure
```
Django-App-Containerization/
│   Dockerfile
│   manage.py
│   requirements.txt
│
├── myproject/
│     ├── __init__.py
│     ├── asgi.py
│     ├── settings.py
│     ├── urls.py
│     ├── wsgi.py
│
└── venv/   ← (local only, not used in Docker)
```

---

# 🟦 Step‑by‑Step Hands‑On

## **Step 1 — Create virtual environment**
```
python -m venv venv
```
Output:
```
(no output if successful)
```


## **Step 2 — Activate venv**
```
./venv/Scripts/activate
```
Output contains prefix:
```
(venv) PS C:\...
```


## **Step 3 — Install Django**
```
pip install django
```
Output (trimmed):
```
Successfully installed django-5.2.8
```


## **Step 4 — Create Django project**
```
django-admin startproject myproject .
```
Output: *(no error)*

Folder now contains:
```
manage.py
myproject/
venv/
```


## **Step 5 — Generate requirements.txt**
```
pip freeze > requirements.txt
```

Output of `ls`:
```
myproject
venv
manage.py
requirements.txt
```


## **Step 6 — Create Dockerfile**
```
# 1. Base image
FROM python:3.11-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
```

`ls` output:
```
Dockerfile
manage.py
requirements.txt
myproject
venv
```

---

# 🏗 Step 7 — Build Docker Image
```
docker build -t django-app .
```

**Build Output (your actual output):**
```
[+] Building 20.7s (11/11) FINISHED
...
=> => naming to docker.io/library/django-app:latest
=> => unpacking to docker.io/library/django-app:latest
```

---

# 🚀 Step 8 — Run Django Container
```
docker run -d -p 8000:8000 django-app
```
Output:
```
cc22e7b91db12e4e9e85d14d08bd4ed853d1033a433b1480a56264b466451f9d
```


## Step 9 — Verify container is running
```
docker ps
```
Output:
```
CONTAINER ID   IMAGE        COMMAND                  CREATED          STATUS          PORTS
cc22e7b91db1   django-app   "python manage.py ru…"   Up ...           0.0.0.0:8000->8000/tcp
```


## Step 10 — Open Django in Browser
Open: **http://localhost:8000**

### Output should look like this:

```
<img src="https://raw.githubusercontent.com/Arvind-Codes-dotcom/DevOps-Learning/c7038603d06df29233883de1c7aaf952cb9cdb04/Docker/Django-App-Containerization/django-output.png" alt="Django Screenshot" style="max-width:100%;height:auto;">

*(Replace with your own uploaded file)*

---

# ☁ Step 11 — Push Image to Docker Hub

## **Login**
```
docker login
```
Output:
```
Login Succeeded
```

## **Tag Image**
```
docker tag django-app arvindcodesdotcom/django-app:latest
```

## **Push Image**
```
docker push arvindcodesdotcom/django-app:latest
```
Output:
```
The push refers to repository [docker.io/arvindcodesdotcom/django-app]
...
latest: digest: sha256:b88664... size: 856
```

---

# 🟥 Step 12 — Stop & Remove Container
```
docker stop cc22e7b91db1
```
Output:
```
cc22e7b91db1
```

```
docker rm cc22e7b91db1
```
Output:
```
cc22e7b91db1
```

---

# 🎉 Completed!
You have successfully containerized a Django application, built a Docker image, pushed it to Docker Hub, and documented the complete workflow.

This will be extremely valuable for:
- Your DevOps portfolio
- Kubernetes deployments later
- Azure ACR & AKS modules
- CI/CD pipelines

