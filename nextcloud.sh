#!/bin/bash

# Mettre à jour le système
sudo apt update
sudo apt upgrade -y

# Installer PHP et d'autres dépendances
sudo apt-get install -y apache2 mariadb-server libapache2-mod-php8.2 imagemagick \
     php8.2-gd php8.2-mysql php8.2-curl php8.2-mbstring \
     php8.2-intl php8.2-imagick php8.2-xml php8.2-zip \
     php8.2-apcu redis-server php8.2-redis \
     php8.2-ldap smbclient php8.2-bcmath php8.2-gmp \

# Activation des modules
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime

# Redémarrage service apache
sudo systemctl restart apache2

#Telechargement Nextcloud
wget https://download.nextcloud.com/server/releases/latest-27.tar.bz2

#Extraction dans le repertoire /var/www/
tar -xvf latest-27.tar.bz2 -C /var/www/

#Changement propriétaire répertoire Nextcloud
chown -R www-data:www-data /var/www/nextcloud/

# Créer une base de données pour Nextcloud
sudo mysql -u root -e "CREATE DATABASE nextcloud;"
sudo mysql -u root -e "CREATE USER 'nextcloud'@'localhost' IDENTIFIED BY 'mot-de-passe';"
sudo mysql -u root -e "GRANT ALL ON nextcloud.* TO 'nextcloud'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

# Activer la configuration du site pour Nextcloud
sudo a2ensite nextcloud.conf

# Redémarrer Apache pour appliquer les modifications
sudo systemctl reload apache2

# Afficher l'adresse IP du serveur pour accéder à Nextcloud
echo "Installation de Nextcloud terminée."
echo "Accédez à votre Nextcloud en utilisant l'adresse : http://$(hostname -I | awk '{print $1}')/nextcloud"










