#!/bin/bash

echo "Installation du module ModSecurity..."
sudo apt-get install -y libapache2-mod-security2

echo "Copie du fichier de configuration par défaut..."
sudo cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf

echo "Configuration d'Apache pour charger le module ModSecurity..."
sudo sh -c 'echo "Include modsecurity.conf" >> /etc/apache2/apache2.conf'

echo "Redémarrage du service Apache pour appliquer les changements..."
sudo service apache2 restart

echo "Vérification du statut de ModSecurity..."
sudo tail /var/log/apache2/error.log
