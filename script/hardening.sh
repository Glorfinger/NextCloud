#!/bin/bash
# ------------------------------------------------------------------
# [Etienne] Hardening
#           OpenSSH - hardening
# ------------------------------------------------------------------
#
# Sauvegarde du fichier de configuration existant, afin de pouvoir le restaurer dans le cas où quelque chose se passerait mal.


#!/bin/bash

echo
echo "Sauvegarde du fichier de configuration existant..."
sudo cp /etc/ssh/sshd_config /etc/ssh/ssh_config_backup

echo "Création du répertoire sshd_config.d..."
if [ ! -d "/etc/ssh/sshd_config.d" ]; then
    sudo mkdir -p /etc/ssh/sshd_config.d
    echo "Include /etc/ssh/sshd_config.d/*.conf" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi

echo "Création du fichier hardening dans /etc/ssh/sshd_config.d..."
sudo touch /etc/ssh/sshd_config.d/hardening.conf
sudo chown root:root /etc/ssh/sshd_config.d/hardening.conf
sudo chmod 644 /etc/ssh/sshd_config.d/hardening.conf

# Nettoyage du fichier de configuration pour ne pas avoir de doublon si le script est lancé plusieurs fois
sudo sed -i '/PermitRootLogin\|MaxAuthTries\|LoginGraceTime\|PermitEmptyPasswords\|PasswordAuthentication\|ChallengeResponseAuthentication\|KerberosAuthentication\|X11Forwarding\|PermitUserEnvironment\|DebianBanner/d' /etc/ssh/sshd_config.d/hardening.conf

echo "Validité de la configuration du serveur SSH..."
sudo sshd -t

# Configuration du fichier hardening.conf
echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'MaxAuthTries 3' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'LoginGraceTime 20' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PermitEmptyPasswords no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'ChallengeResponseAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'KerberosAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'X11Forwarding no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PermitUserEnvironment no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'DebianBanner no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

# Redémarrage du service SSH
sudo service ssh restart

echo "Installation et configuration d'OpenSSH terminées"
echo
echo
echo
echo


: << 'COMMENT'

# Fonction pour afficher une ligne de séparation
print_separator() {
    echo "------------------------------------------------------------"
}

# Fonction pour afficher un message avec mise en forme
print_message() {
    echo -e "\e[1m$1\e[0m"  # Texte en gras
}

# Fonction pour afficher une étape avec mise en forme
print_step() {
    print_separator
    print_message "$1"
    print_separator
}

# Sauvegarde du fichier de configuration existant
print_step "Sauvegarde du fichier de configuration existant..."
sudo cp /etc/ssh/sshd_config /etc/ssh/ssh_config_backup

# Création du répertoire sshd_config.d
print_step "Création du répertoire sshd_config.d..."
if [ ! -d "/etc/ssh/sshd_config.d" ]; then
    sudo mkdir -p /etc/ssh/sshd_config.d
    echo "Include /etc/ssh/sshd_config.d/*.conf" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi

# Création du fichier hardening dans /etc/ssh/sshd_config.d
print_step "Création du fichier hardening dans /etc/ssh/sshd_config.d..."
sudo touch /etc/ssh/sshd_config.d/hardening.conf
sudo chown root:root /etc/ssh/sshd_config.d/hardening.conf
sudo chmod 644 /etc/ssh/sshd_config.d/hardening.conf
sudo sshd -t

# Configuration du fichier hardening.conf
print_step "Configuration du fichier hardening.conf"
echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'MaxAuthTries 3' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'LoginGraceTime 20' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PermitEmptyPasswords no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'ChallengeResponseAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'KerberosAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'X11Forwarding no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'PermitUserEnvironment no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
echo 'DebianBanner no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

# Redémarrage du service SSH
print_step "Redémarrage du service SSH"
sudo service ssh restart

# Message de fin
print_separator
print_message "Installation et configuration d'OpenSSH terminées"
print_separator


: << 'COMMENT'


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

echo
echo "Sauvegarde du fichier de configuration existant..."
sudo cp /etc/ssh/sshd_config /etc/ssh/ssh_config_backup

echo "Création du répertoire sshd_config.d..."
if [ ! -d "/etc/ssh/sshd_config.d" ]; then
    sudo mkdir -p /etc/ssh/sshd_config.d
    echo "Include /etc/ssh/sshd_config.d/*.conf" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi

echo "Création du fichier hardening dans /etc/ssh/sshd_config.d..."
sudo touch /etc/ssh/sshd_config.d/hardening.conf
sudo chown root:root /etc/ssh/sshd_config.d/hardening.conf
sudo chmod 644 /etc/ssh/sshd_config.d/hardening.conf

# Affichage de la progression pour chaque modification
progress_bar 1 "Options actuellement configurées..."
sudo sshd -t

progress_bar 1 "Configuration de la permission..."
echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Limitation du nombre de connexions..."
echo 'MaxAuthTries 3' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Délai de connexion..."
echo 'LoginGraceTime 20' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de l'authentification..."
echo 'PermitEmptyPasswords no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

#progress_bar 1 "Authentification par mots de passe SSH..."
#echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de ChallengeResponseAuthentication..."
echo 'ChallengeResponseAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de KerberosAuthentication..."
echo 'KerberosAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de X11 forwarding..."
echo 'X11Forwarding no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de PermitUserEnvironment..."
echo 'PermitUserEnvironment no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

progress_bar 1 "Désactivation de DebianBanner..."
echo 'DebianBanner no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null

echo "Redémarrage du serveur SSH..."
sudo service ssh restart

echo "Installation et configuration d'OpenSSH terminées"
echo
echo
echo
echo
COMMENT
