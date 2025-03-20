#!/bin/bash
set -e  # Exit on any error
set -o pipefail

echo "Starting Jenkins installation..."

# Download Jenkins GPG key and save it in /usr/share/keyrings/
echo "Downloading Jenkins GPG key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add the Jenkins repository to the system sources list
echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package index
echo "Updating package index..."
sudo apt-get update

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install -y jenkins

echo "Jenkins installation completed successfully!"
