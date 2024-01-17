#!/bin/bash

echo
echo
echo "Installation d'Apache en cours..."
echo

# Installation d'Apache2
sudo apt-get install apache2 -y

echo
echo
echo "Sécurisation du serveur web..."
echo

# Sécurisation du serveur web avec HTTPS
echo
echo "Activation du mode SSL..."
echo
sudo a2enmod ssl 
echo
echo "Configuration de HTTPS..."
echo
sudo a2ensite default-ssl 
echo
echo "Redémarrage d'Apache..."
echo
sudo service apache2 restart 
echo
echo "Rechargement de la configuration d'Apache..."
echo
sudo systemctl reload apache2 
echo
echo "Installation et configuration d'Apache terminées"
echo
echo
echo
echo
