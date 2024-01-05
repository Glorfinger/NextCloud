#!/bin/bash

# Vérification des sources avec apt
sudo apt-get update

# Mise à jour du référentiel avec apt update
sudo apt-get upgrade -y

# Installation d'Apache2
sudo apt-get install apache2 -y

# Sécurisation du serveur web avec HTTPS
sudo a2enmod ssl
sudo a2ensite default-ssl
sudo service apache2 restart
