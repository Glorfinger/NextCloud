#!/bin/bash

#Update and Upgrade the Ubuntu Packages
sudo apt update && apt upgrade

#Install PHP and other Dependencies and Restart Apache
sudo apt install libapache2-mod-php php-bz2 php-gd php-mysql php-curl php-mbstring php-imagick php-zip php-ctype php-curl php-dom php-json php-posix php-bcmath php-xml php-intl php-gmp zip unzip wget

#Enable required Apache modules and restart Apache:
sudo a2enmod rewrite dir mime env headers
sudo systemctl restart apache2

#Create MySQL Database and User for Nextcloud and Provide Permissions.
CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY 'passw@rd';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
FLUSH PRIVILEGES;
quit;

#Download and unzip at the web root (/var/www/html) folder
cd /var/www/html
wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip

#Move all nextcloud content to the web root (/var/www/html) folder
cd /var/www/html/nextcloud
mv * .* ../

#Remove empty nextcloud directory
sudo rmdir /var/www/html/nextcloud

#Change the ownership of the nextcloud content directory to the HTTP user.
sudo chown -R www-data:www-data /var/www/html

#Run the nextcloud installation CLI commands.
cd /var/www/html
sudo -u www-data php occ  maintenance:install --database \
"mysql" --database-name "nextcloud"  --database-user "nextcloud" --database-pass \
"passw@rd" --admin-user "admin" --admin-pass "admin123"

#Nextcloud allowed access only from localhost, it could through error “Access through untrusted domain”. we need to allow accessing nextcloud by using our ip or domain name.

sudo vi /var/www/html/config/config.php

<?php
$CONFIG = array (
  'passwordsalt' => 'VAXFa5LsahAWHK/CMPHC3QkTsnqK80',
  'secret' => 'ZWTuZMLpKVizET85i/NkcwYCPUQyjB/6ZjEYGdVgJeDhNXzR',
  'trusted_domains' =>
  array (
    0 => 'localhost',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',

  .....
:x

#Now save the file and restart apache2

sudo systemctl restart apache2

#Now, Go to the Browser and type http:// [ ip or fqdn ] of the server, as the configuration is completed command line, the Login page will appear.
