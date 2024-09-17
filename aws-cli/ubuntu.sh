#!/bin/bash

# Update the system's package index
sudo apt update

# Install required dependencies
sudo apt install -y curl unzip

# Download the latest AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip the AWS CLI package
unzip awscliv2.zip

# Run the AWS CLI installer
sudo ./aws/install

# Verify the installation
aws --version

# Clean up
rm -rf awscliv2.zip aws/

echo "AWS CLI has been installed successfully!"
