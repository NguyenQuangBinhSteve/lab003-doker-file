#!/bin/bash

echo "Installing Node.js 20 and build tools..."

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get update -y
sudo apt-get install -y nodejs build-essential


# Update npm lên bản mới nhất để có npx
sudo npm install -g npm@latest
# Cài yarn để thay thế npm install (ổn định hơn trong Vagrant)
sudo npm install -g yarn

echo "Node.js installation complete."
node -v
npm -v
npx -v
