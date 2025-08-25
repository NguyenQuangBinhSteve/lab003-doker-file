#!/bin/bash

echo "Starting Docker installation..."

# Gỡ bỏ các phiên bản cũ nếu có
sudo apt-get remove docker docker-engine docker.io containerd runc


# Cập nhật danh sách gói
sudo apt-get update


# Cài đặt các gói cần thiết
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release


# Thêm GPG key từ nguồn chính thức của Docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg


# Thêm repository của Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Cập nhật và cài đặt Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin


# Thêm user 'vagrant' vào group 'docker' để không cần dùng sudo khi chạy lệnh docker
sudo usermod -aG docker vagrant


echo "Docker installation finished."
echo "You may need to log out and log back in for group changes to take effect."
