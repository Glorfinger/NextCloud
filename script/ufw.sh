#!/bin/bash

Barre de progression : 

# Fonction pour afficher une barre de progression
progress_bar() {
    local duration=${1}
    local title=${2:-"Progress"}
    local progress_char="#########################################"
    local total_width=40

    # Calculer le nombre d'itérations en fonction de la durée
    local iterations=$((duration * 10))

    for ((i = 0; i <= iterations; i++)); do
        # Calculer la progression actuelle
        local progress=$((i * total_width / iterations))
        local percent=$((i * 100 / iterations))

        # Construire la barre de progression
        local progress_bar=$(printf "[%-${total_width}s]" "${progress_char:0:progress}")

        # Afficher la barre de progression avec le titre et le pourcentage alignés
        printf "\r%-40s %s %d%%" "$title" "$progress_bar" "$percent"

        # Pause pour simuler une opération
        sleep 0.1
    done


    echo
}

# Installer UFW
echo "Installation d'UFW en cours..."
sudo apt update | progress_bar 1 "Mise à jour des paquets"
sudo apt install ufw -y | progress_bar 1 "Installation d'UFW"

# Activer UFW
echo "Activation d'UFW..."
sudo ufw enable | progress_bar 1 "Activation d'UFW"

# Demander les ports pour SSH, HTTP et HTTPS
read -p "Veuillez entrer le port SSH que vous souhaitez utiliser (par défaut 22) : " ssh_port
read -p "Veuillez entrer le port HTTP que vous souhaitez utiliser (par défaut 80) : " http_port
read -p "Veuillez entrer le port HTTPS que vous souhaitez utiliser (par défaut 443) : " https_port

# Vérifier si les ports sont vides, si c'est le cas, affecter les valeurs par défaut.
ssh_port=${ssh_port:-22}
http_port=${http_port:-80}
https_port=${https_port:-443}

# Modifier le fichier de configuration SSH
sudo sed -i "s/^\(Port \)[0-9]\+/\1$ssh_port/" /etc/ssh/sshd_config | progress_bar 1 "Modification de la configuration SSH"

# Modifier le fichier de configuration Apache pour HTTP
sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/" /etc/apache2/sites-enabled/000-default.conf | progress_bar 1 "Modification de la configuration HTTP"

# Modifier le fichier de configuration Apache pour HTTPS
sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$https_port/" /etc/apache2/sites-enabled/default-ssl.conf | progress_bar 1 "Modification de la configuration HTTPS"

# Recharger la configuration SSH
sudo systemctl reload ssh | progress_bar 1 "Rechargement de la configuration SSH"

# Recharger la configuration Apache
sudo systemctl reload apache2 | progress_bar 1 "Rechargement de la configuration Apache"

# Autoriser le trafic SSH
sudo ufw allow $ssh_port/tcp | progress_bar 1 "Autorisation du trafic SSH"

# Autoriser le trafic HTTP
sudo ufw allow $http_port/tcp | progress_bar 1 "Autorisation du trafic HTTP"

# Autoriser le trafic HTTPS
sudo ufw allow $https_port/tcp | progress_bar 1 "Autorisation du trafic HTTPS"

echo "Configuration d'UFW terminée."


