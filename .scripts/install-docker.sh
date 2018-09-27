#!/bin/bash

echo "Adding required packages..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

echo "Adding Docker repository gpg keys..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Adding Docker repository..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Updating apt cache..."
sudo apt-get update

echo "Installing Docker..."
sudo apt-get install docker-ce -y

echo "Adding user '$(whoami)' to group 'docker'"
sudo usermod -aG docker $(whoami)

echo "Installing Docker-Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

