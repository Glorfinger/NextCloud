#!/bin/bash

# Update package lists and install necessary packages
sudo apt update
sudo apt install -y mariadb-server libapache2-mod-php7.4 \
    php7.4-common php7.4-mysql php7.4-xml php7.4-zip

# Secure MariaDB installation
sudo mysql_secure_installation

# Download and extract Nextcloud
sudo mkdir -p /var/www/html/nextcloud
wget -P /tmp https://download.nextcloud.com/server/releases/latest.tar.bz2
sudo tar -xjf /tmp/latest.tar.bz2 -C /var/www/html/

# Set permissions
sudo chown -R www-data:www-data /var/www/html/nextcloud/

# Create a database and user for Nextcloud
sudo mysql -e "CREATE DATABASE nextcloud;"
sudo mysql -e "CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

echo "Nextcloud has been successfully installed."











