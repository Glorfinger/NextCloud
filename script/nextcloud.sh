#!/bin/bash

#Update and Upgrade the Ubuntu Packages
sudo apt update && apt upgrade

#install Apache and MySQL Server
sudo apt install apache2 

#Install PHP and other Dependencies and Restart Apache

sudo apt install libapache2-mod-php php-bz2 php-gd php-curl php-mbstring php-imagick php-zip php-ctype php-curl php-dom php-json php-posix php-bcmath php-xml php-intl php-gmp zip unzip wget

#Enable required Apache modules and restart Apache:
sudo a2enmod rewrite dir mime env headers
sudo systemctl restart apache2

#Download and unzip at the web root (/var/www/html) folder
cd /var/www/html
wget https://download.nextcloud.com/server/releases/latest.zip
unzip latest.zip

#Move all nextcloud content to the web root (/var/www/html) folder
cd /var/www/html/nextcloud
sudo mv * .* ../

#Remove empty nextcloud directory
sudo rmdir /var/www/html/nextcloud

#Change the ownership of the nextcloud content directory to the HTTP user.
sudo chown -R www-data:www-data /var/www/html

#Run the nextcloud installation CLI commands.
cd /var/www/html
sudo -u www-data php occ  maintenance:install

#If everything goes well the command will output “Nextcloud was successfully installed”.

#Now save the file and restart apache2

sudo systemctl restart apache2

#Now, Go to the Browser and type http:// [ ip or fqdn ] of the server, as the configuration is completed command line, the Login page will appear.






