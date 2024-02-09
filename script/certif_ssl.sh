#!/bin/bash

echo "Vérification et création du dossier nextcloud-ssl.conf..."
SSL_DIR="/etc/ssl/nextcloud-ssl.conf"
if [ ! -d "$SSL_DIR" ]; then
    sudo mkdir -p "$SSL_DIR"
fi

echo "Installation d'OpenSSL..."
sudo apt install -y openssl

echo "Création du certificat auto-signé..."
CERT_PATH="/etc/ssl/nextcloud-ssl.conf/autosigned.crt"
KEY_PATH="/etc/ssl/nextcloud-ssl.conf/autosigned.key"
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "${KEY_PATH}" -out "${CERT_PATH}" -subj "/C=FR/ST=State/L=City/O=Organization/CN="

echo "Affichage du certificat généré..."
sudo cat "${CERT_PATH}"

echo "Affichage de la clé privée générée..."
sudo cat "${KEY_PATH}"

echo "Modification du chemin des fichiers dans default-ssl.conf..."
DEFAULT_SSL_CONF="/etc/apache2/sites-available/default-ssl.conf"
sudo sed -i "s|SSLCertificateFile.*|SSLCertificateFile ${CERT_PATH}|" "$DEFAULT_SSL_CONF"
sudo sed -i "s|SSLCertificateKeyFile.*|SSLCertificateKeyFile ${KEY_PATH}|" "$DEFAULT_SSL_CONF"

echo "Redémarrage d'Apache..."
echo
sudo service apache2 restart 

echo "Apache a été redémarré avec succès."
