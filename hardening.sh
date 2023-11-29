#!/bin/bash
# ------------------------------------------------------------------
# [Etienne] Hardening
#           OpenSSH - hardening
# ------------------------------------------------------------------
#
# Sauvegarde de votre fichier de configuration existant, afin de pouvoir le restaurer dans le cas improbable où quelque chose se passerait mal.
#sudo cp /etc/ssh/sshd_config /etc/ssh/ssh_config_backup
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
sudo echo 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Limitation du nombre de connexions dans le fichier hardening.
sudo echo 's/MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/sshd_config.d/hardening.conf
#
# Délai de connexion dans le fichier hardening.
sudo echo 's/LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation de l'authentification dans le fichier hardening.
sudo echo 's/PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Authentification par mots de passe SSH dans le fichier hardening.
sudo echo 's/PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation de la méthode d'authentification ChallengeResponseAuthentication dans le fichier hardening.
sudo echo 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation de la méthode d'authentification KerberosAuthentication dans le fichier hardening.
sudo echo 's/KerberosAuthentication.*/KerberosAuthentication no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation de la méthode d'authentification GSSAPIAuthentication dans le fichier hardening.
#sudo echo 's/GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation du X11 forwarding dans le fichier hardening.
sudo echo 's/X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Comme X11 forwarding est peu utilisé, on le désactive dans le fichier hardening.
sudo echo 's/PermitUserEnvironment.*/PermitUserEnvironment no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Désactivation du DebianBanner dans le fichier hardening.
sudo echo 's/DebianBanner.*/DebianBanner no/' /etc/ssh/sshd_config.d/hardening.conf
#
# Redémarrage du serveur.
sudo service ssh restart










