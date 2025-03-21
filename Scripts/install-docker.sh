#!/bin/bash

# Update and install dependencies
sudo apt update && sudo apt install -y ca-certificates curl gnupg

# Ensure /etc/apt/keyrings exists before adding the GPG key
sudo mkdir -p /etc/apt/keyrings

# Add Docker’s GPG key and repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io

# Start and enable Docker
sudo systemctl enable --now docker

# Add the current user to the Docker group
sudo usermod -aG docker $USER

# Apply group change without logout
newgrp docker

# Verify installation
echo "✅ Docker installed successfully!"
docker --version


