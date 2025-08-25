#!/bin/bash

# Cập nhật hệ thống ...
echo "Updating package list..."
apt-get update -y
echo "System updated."

# Cài đặt Apache2 ...
echo "Installing Apache2..."
apt-get install -y apache2
echo "Apache2 installed."

# Cấu hình Apache ...
# Tắt trang web mặc định của Apache ...
echo "Disabling default Apache site..."
a2dissite 000-default.conf

# Tạo file cấu hình Virtual Host mới cho dự án ...
echo "Creating new Virtual Host config for the project..."
cat > /etc/apache2/sites-available/project.conf <<EOF
<VirtualHost *:80>
    ServerName webaster.localhost
    DocumentRoot /var/www/project
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Kích hoạt trang web của dự án ...
echo "Enabling project site..."
a2ensite project.conf

# Khởi động lại Apache để áp dụng thay đổi ...
echo "Restarting Apache..."
systemctl restart apache2

echo "Provisioning finished!"