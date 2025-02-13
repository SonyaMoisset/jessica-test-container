# Use Ubuntu 16.04 as the base image
FROM ubuntu:16.04

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the host’s current directory into the container’s /app directory
COPY . .

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y curl git nano && \
    apt-get clean

# Expose port 8080 so that the service can be accessed externally
EXPOSE 8080

# Define the default command to run when the container starts
CMD ["./start-service.sh"]
