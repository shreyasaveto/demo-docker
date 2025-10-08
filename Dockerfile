# 1. Base Image: Use a stable, slim version of Python for a small image size
FROM python:3.11-slim

# 2. Working Directory: Set the directory inside the container
WORKDIR /app

# 3. Copy Requirements & Install Dependencies:
# We copy requirements.txt first. If only the code changes, Docker can reuse this layer (caching), speeding up builds.
COPY requirements.txt .

# Install dependencies from the pinned list
# --no-cache-dir keeps the final image smaller
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copy Application Code: Copy the rest of the files (main.py, etc.)
COPY . .

# 5. Expose Port: Inform the outside world that the container listens on port 8000
EXPOSE 8000

# 6. Startup Command: The command executed when the container starts
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
# The format is <module_name>:<fastapi_app_object>
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]