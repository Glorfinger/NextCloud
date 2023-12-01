#!/bin/bash

# Function to install Apache based on the package manager
install_apache() {
    if [[ -n $(command -v apt-get) ]]; then
        sudo apt-get update
        sudo apt-get install -y apache2
    elif [[ -n $(command -v yum) ]]; then
        sudo yum update
        sudo yum install -y httpd
    else
        echo "Unsupported package manager. Exiting."
        exit 1
    fi
}

# Function to start Apache service
start_apache() {
    if [[ -n $(command -v systemctl) ]]; then
        sudo systemctl start apache2 || sudo systemctl start httpd
    else
        sudo service apache2 start || sudo service httpd start
    fi
}

# Install Apache
install_apache

# Start Apache
start_apache

# Check status of Apache (optional)
if [[ -n $(command -v systemctl) ]]; then
    sudo systemctl status apache2 || sudo systemctl status httpd
else
    sudo service apache2 status || sudo service httpd status
fi




#!/bin/bash

connexion ssh
verification des sources avec apt 
met a jour le référenciel avec apt update
install apache2
sécurise le serveur web avec du https 


#!/bin/bash

# Demander les informations de connexion SSH
read -p "Entrez votre nom d'utilisateur SSH : " username
read -p "Entrez l'adresse du serveur : " server_address

# Connexion SSH (le mot de passe sera demandé lors de la connexion)
ssh "$username"@"$server_address"

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