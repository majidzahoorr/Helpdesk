# Use official Python slim base image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Install system dependencies and netcat-openbsd
RUN apt-get update && \
    apt-get install -y gcc libpq-dev build-essential postgresql-client netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*


# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the entire project directory to the container
COPY . /app/

# Copy script.sh script
COPY script.sh /app/script.sh

# Ensure the script has execution permission
RUN chmod +x /app/script.sh

# Change the working directory to where manage.py is located
WORKDIR /app/backend

# Expose port

EXPOSE 8001

# Command to run the application
CMD ["./script.sh", "DB_HOST", "python", "manage.py", "runserver", "0.0.0.0:8002"]
