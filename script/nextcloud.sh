#!/bin/bash

# Update package lists
sudo apt-get update
sudo apt-get upgrade

echo
echo
echo "Installation des packages en cours..."
echo

# Install necessary packages
sudo apt-get install mariadb-server php8.2 php8.2-common php8.2-curl php8.2-gd php8.2-intl php8.2-mbstring php8.2-xmlrpc php8.2-mysql php8.2-xml php8.2-cli php8.2-zip
sudo apt-get install wget unzip

echo
echo
echo "Installation de Nextcloud en cours..."
echo

# Telecharge Nextcloud
wget https://download.nextcloud.com/server/releases/latest.zip

# Deplace Nextcloud au bon endroit
echo
cd /tmp
echo
sudo unzip latest.zip
echo
mv nextcloud/ /var/www/html/
echo

# Modifier les droits de Nextcloud pour Apache2
echo
chown -R www-data:www-data /var/www/html/nextcloud
echo

echo
echo "Préparation de la base de donné en cours..."
echo 

# Securise mysql
echo
sudo mysql_secure_installation
echo

#Connexion à mysql
echo
mysql -u root -p
echo

# Création de la database
echo
CREATE DATABASE db23nextcloud;
echo
GRANT ALL ON db23nextcloud.* TO 'usr23nextcloud'@'localhost' IDENTIFIED BY 'Password14';
echo
FLUSH PRIVILEGES;
echo
EXIT;
echo
echo
echo "Nextcloud has been successfully installed."
echo "Accédez à votre Nextcloud en utilisant l'adresse : http://$(hostname -I | awk '{print $1}')/nextcloud"

