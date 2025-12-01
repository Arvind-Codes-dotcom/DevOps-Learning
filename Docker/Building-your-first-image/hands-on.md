# Docker Hands-On Part 3 — Building Your First Docker Image

This hands-on lab covers:
- Creating a simple Python web application  
- Writing a Dockerfile  
- Building your first custom Docker image  
- Running the image as a container  
- Accessing the application in the browser  
- Stopping and removing containers  

---

# 📁 Step 1 — Folder Structure

```
03-Building-Your-First-Image/
   ├── app.py
   └── Dockerfile
```

---

# 📝 Step 2 — Python Application (`app.py`)

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from my first Docker container!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
```

---

# 🧱 Step 3 — Dockerfile

```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask
EXPOSE 5000
CMD ["python", "app.py"]
```

---

# 🏗 Step 4 — Build the Docker Image

### **Command**
```bash
docker build -t my-first-app .
```

### **Output**
```
[+] Building 11.9s (9/9) FINISHED                                                                                                                            docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                         0.1s
 => => transferring dockerfile: 305B                                                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/python:3.9-slim                                                                                                           1.1s
 => [internal] load .dockerignore                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                              0.0s
 => [1/4] FROM docker.io/library/python:3.9-slim@sha256:2d97f6910b16bd338d3060f261f53f144965f755599aab1acda1e13cf1731b1b                                                     4.5s
 => => resolve docker.io/library/python:3.9-slim@sha256:2d97f6910b16bd338d3060f261f53f144965f755599aab1acda1e13cf1731b1b                                                     0.0s 
 => => sha256:38513bd7256313495cdd83b3b0915a633cfa475dc2a07072ab2c8d191020ca5d 27.26MB / 29.78MB                                                                            10.5s 
 => => sha256:ea56f685404adf81680322f152d2cfec62115b30dda481c2c450078315beb508 251B / 251B                                                                                   0.2s 
 => => sha256:fc74430849022d13b0d44b8969a953f842f59c6e9d1a0c2c83d710affa286c08 13.88MB / 13.88MB                                                                             1.2s
 => => sha256:b3ec39b36ae8c03a3e09854de4ec4aa08381dfed84a9daa075048c2e3df3881d 1.29MB / 1.29MB                                                                               0.4s
 => => extracting sha256:38513bd7256313495cdd83b3b0915a633cfa475dc2a07072ab2c8d191020ca5d                                                                                    1.4s 
 => => extracting sha256:b3ec39b36ae8c03a3e09854de4ec4aa08381dfed84a9daa075048c2e3df3881d                                                                                    0.1s 
 => => extracting sha256:fc74430849022d13b0d44b8969a953f842f59c6e9d1a0c2c83d710affa286c08                                                                                    0.8s
 => => extracting sha256:ea56f685404adf81680322f152d2cfec62115b30dda481c2c450078315beb508                                                                                    0.0s
 => [internal] load build context                                                                                                                                            0.1s
 => => transferring context: 2.50kB                                                                                                                                          0.0s 
 => [2/4] WORKDIR /app                                                                                                                                                       0.6s 
 => [3/4] COPY . .                                                                                                                                                           0.1s 
 => [4/4] RUN pip install flask                                                                                                                                              3.9s 
 => exporting to image                                                                                                                                                       1.4s 
 => => exporting layers                                                                                                                                                      0.8s 
 => => exporting manifest sha256:f7129236d1110191bc162e5027cd2ed14038f7fecd5f83881b2f6ff816cdeaba                                                                            0.0s 
 => => exporting config sha256:b11cb5979fd099c3483a39f10ce59f6709a8730c825a2dae188ae002d60541f6                                                                              0.0s 
 => => exporting attestation manifest sha256:27815441df7d192701865d9c9d1553660b04247dbb14016905b0441c39058d84                                                                0.0s 
 => => exporting manifest list sha256:9f9cf2db543818986efe3be821c6caa68ec316542b6836de735ba10e290790d1                                                                       0.0s 
 => => naming to docker.io/library/my-first-app:latest                                                                                                                       0.0s 
 => => unpacking to docker.io/library/my-first-app:latest   
```

---

# 📦 Step 5 — List Docker Images

### **Command**
```bash
docker images
```

### **Output**
```
IMAGE                 ID             DISK USAGE   CONTENT SIZE   EXTRA
my-first-app:latest   9f9cf2db5438        203MB         49.7MB        
nginx:latest          553f64aecdc3        225MB         59.8MB    U   
```

---

# 🚀 Step 6 — Run Your Custom Container

### **Command**
```bash
docker run -d -p 5000:5000 my-first-app
```

### **Output**
```
5adda9257a836e9c6269123d9ae67806a8475f70de57c0f445cfc0f0a3b4e1ab
```

---

# 🌐 Step 7 — Test the App in Browser

Visit:

```
http://localhost:5000
```

### **Result Screenshot**
The browser displayed:

```
Hello from my first Docker container!
```

(*See screenshot in logs*)

---

# 🟦 Step 8 — Check Running Containers

### **Command**
```bash
docker ps
```

### **Output**
```
CONTAINER ID   IMAGE          COMMAND           CREATED         STATUS         PORTS                                         NAMES
5adda9257a83   my-first-app   "python app.py"   4 minutes ago   Up 4 minutes   0.0.0.0:5000->5000/tcp, [::]:5000->5000/tcp   priceless_hypatia
```

---

# 🟥 Step 9 — Stop the Container

### **Command**
```bash
docker stop 5adda9257a83
```

### **Output**
```
5adda9257a83
```

---

# 🗑 Step 10 — Remove the Container

### **Command**
```bash
docker rm 5adda9257a83
```

### **Output**
```
5adda9257a83
```

---

# ✅ Summary of What Was Achieved

- Built your first custom Docker image  
- Containerized a Python Flask web application  
- Ran it using Docker  
- Successfully accessed it in the browser  
- Stopped and removed the container  
- Understood how Dockerfile instructions translate into image layers  
- Learned the real DevOps workflow for containerizing applications 
