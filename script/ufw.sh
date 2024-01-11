#!/bin/bash

 # Installer UFW
sudo apt update
sudo apt install ufw

# Activer UFW
sudo ufw enable

# Demander les ports pour SSH, HTTP et HTTPS
read -p "Veuillez entrer le port SSH que vous souhaitez utiliser (par défaut 22) : " ssh_port
read -p "Veuillez entrer le port HTTP que vous souhaitez utiliser (par défaut 80) : " http_port
read -p "Veuillez entrer le port HTTPS que vous souhaitez utiliser (par défaut 443) : " https_port

# Vérifier si les ports sont vides, si c'est le cas,  affecter les valeurs par défaut.
ssh_port=${ssh_port:-22}
http_port=${http_port:-80}
https_port=${https_port:-443}

# Modifier le fichier de configuration SSH
sudo sed -i "s/^\(Port \)[0-9]\+/\1$ssh_port/" /etc/ssh/sshd_config

# Modifier le fichier de configuration Apache pour HTTP
sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/"  /etc/apache2/sites-enabled/000-default.conf

# Modifier le fichier de configuration Apache pour HTTPS
sudo sed -i "s/^\(Listen \)[0-9]\+/\1$https_port/" /etc/apache2/sites-enabled/default-ssl.conf

# Recharger la configuration SSH
sudo systemctl reload ssh

# Recharger la configuration Apache
sudo systemctl reload apache2

# Autoriser le trafic SSH
sudo ufw allow $ssh_port/tcp

# Autoriser le trafic HTTP
sudo ufw allow $http_port/tcp

# Autoriser le trafic HTTPS
sudo ufw allow $https_port/tcp

echo "Configuration d'UFW terminée."

