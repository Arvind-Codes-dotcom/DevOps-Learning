# 1. Base image
FROM python:3.11-slim

# 2. Set working directory inside container
WORKDIR /app

# 3. Copy requirements first
COPY requirements.txt .

# 4. Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy the project files
COPY . .

# 6. Expose Django port
EXPOSE 8000

# 7. Run Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
