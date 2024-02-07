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
sudo apt-get install wget unzip dnsutils

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
PORT=$(grep -oP '<VirtualHost \*:([0-9]+)' /etc/apache2/sites-enabled/000-default.conf | grep -oP '([0-9]+)')
# Créer le fichier de configuration Nextcloud
echo
sudo touch /etc/apache2/sites-available/nextcloud.conf
echo
# Récupérer du numéro de port précedemment renseigné
sudo tee /etc/apache2/sites-available/nextcloud.conf > /dev/null <<EOF
<VirtualHost *:${PORT}>
  DocumentRoot /var/www/nextcloud/
  ServerName  localhost

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

# Création de la base de donné
echo
echo "Préparation de la base de donné en cours..."
echo 
read -p "Choisissez un nom d'utilisateur : " DB_USER
echo
read -p "Choisissez un mot de passe : " DB_PASSWORD
echo
read -p "Choisissez un nom de base de donnés : " DB_NAME
echo
sudo mysql --user=root <<-EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD( '$DB_PASSWORD' );
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF
echo
sudo mysql --user=root --password="$DB_PASSWORD" <<-EOF
CREATE DATABASE '$DB_NAME';
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON nextcloud.* TO '$DB_USER'@"localhost";
FLUSH PRIVILEGES;
EOF
echo
echo "La base de données $DB_NAME a été créée avec succès pour l'utilisateur $DB_USER."

echo
echo "Nextcloud has been successfully installed."
WANIP4=$(dig @resolver4.opendns.com myip.opendns.com +short -4)
echo "Accédez à votre Nextcloud en utilisant l'adresse : http://${WANIP4}:${PORT}/nextcloud"


