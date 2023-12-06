#!/bin/bash

# connexion ssh
# verification des sources avec apt 
# met a jour le référenciel avec apt update
# install apache2
# sécurise le serveur web avec du https 

# Fonction pour vérifier si une chaîne est un port valide
valid_port() {
    local port="$1"
    # Vérifie si le port est un nombre compris entre 1 et 65535
    if [[ $port =~ ^[1-9][0-9]{0,4}$ && $port -le 65535 ]]; then
        return 0 # Port valide
    else
        return 1 # Port invalide
    fi
}

# Fonction pour vérifier si une chaîne est une adresse IP valide
valid_ip() {

    # Fait référence au première argument passé dans la fonction lors de son appel donc l'adresse IP cf ligne 30
    local ip="$1"
    # Vérifie si l'adresse IP a le format xxx.xxx.xxx.xxx 
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0 # Adresse IP valide
    else
        return 1 # Adresse IP invalide
    fi
}

# Boucle pour la saisie des informations
while true; do
    # Vérifier si l'utilisateur est connecté en SSH
    if [ -n "$SSH_CONNECTION" ]; then
        echo "Vous êtes connecté en SSH."
    else    
        # Demande des identifiants de connexion
        read -p "SSH IP address: " ip_address

        # Vérification de l'adresse IP
        while ! valid_ip "$ip_address"; do
            echo "Adresse IP invalide. Veuillez entrer une adresse IP valide."
            read -p "SSH IP address: " ip_address
        done

        read -p "SSH Port: " ssh_port

        # Vérification du port
        while ! valid_port "$ssh_port"; do
            echo "Port invalide. Veuillez entrer un port valide."
            read -p "SSH Port: " ssh_port
        done

        read -p "SSH Username: " username
        read -p "Password (pwd) or Private key (pk)? " auth_type

        if [ "$auth_type" == "pwd" ]; then
            read -s -p "SSH password: " password
        else
            read -s -p "Private key: " private_key
        fi

        # Test de la connexion SSH
        if ssh -q -o ConnectTimeout=5 "$username"@"$ip_address" -p "$ssh_port" exit; then
            echo "Connexion SSH réussie."
            break  # Sortir de la boucle si la connexion est réussie
        else
            echo "Échec de la connexion SSH. Veuillez vérifier les informations de connexion et réessayez."
        fi
    fi
done

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


# # Function to install Apache based on the package manager
# install_apache() {
#     if [[ -n $(command -v apt-get) ]]; then
#         sudo apt-get update
#         sudo apt-get install -y apache2
#     elif [[ -n $(command -v yum) ]]; then
#         sudo yum update
#         sudo yum install -y httpd
#     else
#         echo "Unsupported package manager. Exiting."
#         exit 1
#     fi
# }

# # Function to start Apache service
# start_apache() {
#     if [[ -n $(command -v systemctl) ]]; then
#         sudo systemctl start apache2 || sudo systemctl start httpd
#     else
#         sudo service apache2 start || sudo service httpd start
#     fi
# }

# # Install Apache
# install_apache

# # Start Apache
# start_apache

# # Check status of Apache (optional)
# if [[ -n $(command -v systemctl) ]]; then
#     sudo systemctl status apache2 || sudo systemctl status httpd
# else
#     sudo service apache2 status || sudo service httpd status
# fi
