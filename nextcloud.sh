#Telechargement Nextcloud
wget https://download.nextcloud.com/server/releases/latest-27.tar.bz2

#Extraction dans le repertoire /var/www/
tar -xvf latest-27.tar.bz2 -C /var/www/

# Activation du site nextcloud
a2ensite nextcloud.conf

# Activation des modules
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime

# SSL
a2enmod ssl
a2ensite default-ssl

# Redémarrage service apache
systemctl restart apache2

#Changement propriétaire répertoire Nextcloud
chown -R www-data:www-data /var/www/nextcloud/

#Verification version
sudo -u www-data php /var/www/nextcloud/occ -V
sudo -u www-data php /var/www/nextcloud/occ status
