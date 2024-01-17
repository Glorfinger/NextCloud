#!/bin/bash

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

echo
echo
echo "Installation d'Apache en cours..."
echo

# Installation d'Apache2
sudo apt-get install apache2 -y | { progress_bar 1 "Installation d'Apache"; }

# Sécurisation du serveur web avec HTTPS
sudo a2enmod ssl | { progress_bar 1 "Activation du mode SSL"; }

sudo a2ensite default-ssl | { progress_bar 1 "Configuration de HTTPS"; }

sudo service apache2 restart | { progress_bar 1 "Redémarrage d'Apache"; }

sudo systemctl reload apache2 | { progress_bar 1 "Rechargement de la configuration d'Apache"; }

echo "Installation et configuration d'Apache terminées"
echo
echo
echo
echo
