#!/bin/bash
# ------------------------------------------------------------------
# [Etienne] Hardening
#           OpenSSH - hardening
# ------------------------------------------------------------------
#
# Sauvegarde du fichier de configuration existant, afin de pouvoir le restaurer dans le cas où quelque chose se passerait mal.
sudo cp /etc/ssh/sshd_config /etc/ssh/ssh_config_backup

# Création du répertoire sshd_config.d s'il n'existe pas
if [ ! -d "/etc/ssh/sshd_config.d" ]; then
    # Créer le répertoire s'il n'existe pas
    sudo mkdir -p /etc/ssh/sshd_config.d
    # Ajouter la ligne au fichier sshd_config
    echo "Include /etc/ssh/sshd_config.d/*.conf" | sudo tee -a /etc/ssh/sshd_config > /dev/null
fi
# Création du fichier hardening dans /etc/ssh/sshd_config.d
sudo touch /etc/ssh/sshd_config.d/hardening.conf
sudo chown root:root /etc/ssh/sshd_config.d/hardening.conf
sudo chmod 644 /etc/ssh/sshd_config.d/hardening.conf
#
# options actuellement configurées.
sudo sshd -t
#
# Configuration de la permission dans le fichier hardening.
echo 'PermitRootLogin no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Limitation du nombre de connexions dans le fichier hardening.
echo 'MaxAuthTries 3' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Délai de connexion dans le fichier hardening.
echo 'LoginGraceTime 20' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Désactivation de l'authentification dans le fichier hardening.
echo 'PermitEmptyPasswords no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Authentification par mots de passe SSH dans le fichier hardening.
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Désactivation de la méthode d'authentification ChallengeResponseAuthentication dans le fichier hardening.
echo 'ChallengeResponseAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Désactivation de la méthode d'authentification KerberosAuthentication dans le fichier hardening.
echo 'KerberosAuthentication no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Désactivation du X11 forwarding dans le fichier hardening.
echo 'X11Forwarding no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Comme X11 forwarding est peu utilisé, on le désactive dans le fichier hardening.
echo 'PermitUserEnvironment no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Désactivation du DebianBanner dans le fichier hardening.
echo 'DebianBanner no' | sudo tee -a /etc/ssh/sshd_config.d/hardening.conf > /dev/null
#
# Redémarrage du serveur.
sudo service ssh restart
