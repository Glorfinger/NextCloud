#!/bin/bash

echo
echo
echo "Installation d'Apache en cours..."
echo

# Installation d'Apache2
sudo apt-get install apache2 -y

# Sécurisation du serveur web avec HTTPS
sudo a2enmod ssl 
sudo a2ensite default-ssl 
sudo service apache2 restart 
sudo systemctl reload apache2 

echo "Installation et configuration d'Apache terminées"
echo
echo
echo
echo
