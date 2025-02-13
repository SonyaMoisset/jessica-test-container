# Use Debian as the base image
FROM debian:latest

# Set the working directory inside the container to /legacy-app
WORKDIR /legacy-app

# Copy all files from the host’s current directory into the container’s /legacy-app directory
COPY . .

# Update package lists and install application dependencies along with debugging tools, then clean up the cache
RUN apt-get update && \
    apt-get install -y debug-tool packageX && \
    apt-get clean

# Set an environment variable with a hardcoded secret (for demonstration purposes)
ENV SECRET_KEY="hardcoded_secret_value"

# Expose ports 5000 and 6000 so the application can communicate externally
EXPOSE 5000 6000

# Define the default command to start the legacy application
CMD ["./run-legacy-app"]
