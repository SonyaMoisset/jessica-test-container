# Step 1: Use an outdated base image with known vulnerabilities
FROM ubuntu:18.04

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Install application dependencies with no version pinning (vulnerable practice)
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    curl \
    wget \
    git && \
    rm -rf /var/lib/apt/lists/*

# Step 4: Add a secret API key in an environment variable (vulnerability: hardcoded secret)
ENV API_KEY=12345secretapikey

# Step 5: Expose sensitive ports
EXPOSE 22 8080

# Step 6: Copy application files
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Step 7: Use a hardcoded user account and permissions (vulnerability)
RUN useradd -m insecureuser && \
    echo "insecureuser:weakpassword" | chpasswd && \
    chmod -R 777 /app

# Step 8: Run the application with a potentially dangerous command
CMD ["python3", "app.py"]
