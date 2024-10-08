# How to Deploy an Ubuntu Container Using Docker

This guide will walk you through the steps to deploy an Ubuntu environment inside a Docker container by running a simple shell script.

---

## Prerequisites

Before starting, ensure you have the following:

- A system with **Docker** installed. You can install Docker by following the [official Docker installation guide](https://docs.docker.com/get-docker/).

---

## Steps

### 1. Create the Shell Script

Create a shell script named `deploy_ubuntu_docker.sh` that will automate the process of pulling and running an Ubuntu Docker container.

#### Script Content:

```bash
#!/bin/bash

# Function to check if Docker is installed
check_docker_installed() {
    if ! [ -x "$(command -v docker)" ]; then
        echo "Error: Docker is not installed. Please install Docker and try again."
        exit 1
    fi
}

# Function to pull the Ubuntu Docker image
pull_ubuntu_image() {
    echo "Pulling the Ubuntu Docker image..."
    docker pull ubuntu:latest
}

# Function to run Ubuntu container
run_ubuntu_container() {
    echo "Running Ubuntu container..."
    docker run -itd --name ubuntu-container ubuntu:latest /bin/bash
}

# Function to check if the container is running
check_container_running() {
    if [ "$(docker ps -q -f name=ubuntu-container)" ]; then
        echo "Ubuntu container is running successfully."
    else
        echo "Error: Failed to run the Ubuntu container."
        exit 1
    fi
}

# Main script execution
echo "Starting the Ubuntu EC2 instance simulation in Docker..."

# Check if Docker is installed
check_docker_installed

# Pull Ubuntu Docker image
pull_ubuntu_image

# Run Ubuntu container
run_ubuntu_container

# Check if the container is running
check_container_running

echo "Ubuntu container deployed and ready to use!"

```

# 2. Make the Script Executable
After creating the script, you need to make it executable.

Run the following command in the terminal to grant execute permissions to the script:

```
chmod +x deploy_ubuntu_docker.sh
```


# 3. Run the Script
Once the script is executable, run it using the following command:

```
./deploy_ubuntu_docker.sh
```


# 4. Check the Running Container
The script will pull the latest Ubuntu image from Docker Hub and start a container named ubuntu-container.

To check if the container is running, use the following Docker command:

```
docker ps
```


# 5. Access the Container
To access the running Ubuntu container, use the following command:

```
docker exec -it ubuntu-container /bin/bash
```
# Troubleshooting
Docker not installed: If you receive an error saying Docker is not installed, refer to this guide to install Docker on your system.

Container not running: If the container fails to run, try checking the Docker logs with the following command:

```
docker logs ubuntu-container
```
