#!/bin/bash

# Stop all running containers
echo "Stopping all running containers..."
sudo docker stop $(sudo docker ps -q)

# Remove all containers (including stopped ones)
echo "Removing all containers..."
sudo docker rm $(sudo docker ps -a -q)

# Remove all unused volumes
echo "Removing all unused volumes..."
sudo docker volume prune -f

# Remove all unused networks (optional)
echo "Removing all unused networks..."
sudo docker network prune -f

# Remove all images (optional)
echo "Removing all images..."
sudo docker rmi $(sudo docker images -q)

# Perform a full cleanup: containers, images, volumes, networks
echo "Performing full system cleanup..."
sudo docker system prune -a --volumes -f

echo "Docker cleanup complete!"
