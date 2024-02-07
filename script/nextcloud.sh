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
wget -P /tmp https://download.nextcloud.com/server/releases/latest.zip

# Deplace Nextcloud au bon endroit
echo
cd /tmp
echo
sudo unzip latest.zip
echo
sudo mv nextcloud/ /var/www/html/
echo

# Modifier les droits de Nextcloud pour Apache2
echo
sudo chown -R www-data:www-data /var/www/html/nextcloud
echo

# Créer le fichier de configuration Nextcloud
echo
sudo touch /etc/apache2/sites-available/nextcloud.conf
echo
sudo tee /etc/apache2/sites-available/nextcloud.conf > /dev/null <<EOF
<VirtualHost *:8151>
  DocumentRoot /var/www/nextcloud/
  ServerName  http://176.9.10.239

  <Directory /var/www/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>
EOF

echo
echo "Redmarrage d'Apache2 en cours..."
echo
# Redemarage d'Apache2
echo
sudo systemctl reload apache2
echo

# Connecter Nextcloud
echo
sudo a2ensite nextcloud.conf
echo

echo
echo "Préparation de la base de donné en cours..."
echo 

# Securise mysql
echo
sudo mysql_secure_installation
echo

# Demander les ports HTTP et HTTPS
echo
read -p "Veuillez entrer le port HTTP que vous souhaitez utiliser (par défaut 80) : " http_port
echo

# Vérifier si les ports sont vides, si c'est le cas, affecter les valeurs par défaut.
echo
http_port=${http_port:-80}
echo

# Modifier le fichier de configuration Apache pour HTTP
echo "Modification du fichier de configuration Apache pour HTTP..."
sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/" /etc/apache2/sites-available/nextcloud.conf

#Connexion à mysql
echo
sudo mysql -u root -p
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

