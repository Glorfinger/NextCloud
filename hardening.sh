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
# Création du fichier hardening dans /etc/ssh/sshd_config.d
sudo touch /etc/ssh/sshd_config.d/hardening
#
# options actuellement configurées.
sudo sshd -t
#
# Configuration de la permission dans le fichier hardening.
sudo sed -i 's/PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config.d/hardening
#
# Limitation du nombre de connexions dans le fichier hardening.
sudo sed -i 's/MaxAuthTries.*/MaxAuthTries 3/' /etc/ssh/sshd_config.d/hardening
#
# Délai de connexion dans le fichier hardening.
sudo sed -i 's/LoginGraceTime.*/LoginGraceTime 20/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation de l'authentification dans le fichier hardening.
sudo sed -i 's/PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config.d/hardening
#
# Authentification par mots de passe SSH dans le fichier hardening.
sudo sed -i 's/PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation de la méthode d'authentification ChallengeResponseAuthentication dans le fichier hardening.
sudo sed -i 's/ChallengeResponseAuthentication.*/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation de la méthode d'authentification KerberosAuthentication dans le fichier hardening.
sudo sed -i 's/KerberosAuthentication.*/KerberosAuthentication no/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation de la méthode d'authentification GSSAPIAuthentication dans le fichier hardening.
#sudo sed -i 's/GSSAPIAuthentication.*/GSSAPIAuthentication no/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation du X11 forwarding dans le fichier hardening.
sudo sed -i 's/X11Forwarding.*/X11Forwarding no/' /etc/ssh/sshd_config.d/hardening
#
# Comme X11 forwarding est peu utilisé, on le désactive dans le fichier hardening.
sudo sed -i 's/PermitUserEnvironment.*/PermitUserEnvironment no/' /etc/ssh/sshd_config.d/hardening
#
# Désactivation du DebianBanner dans le fichier hardening.
sudo sed -i 's/DebianBanner.*/DebianBanner no/' /etc/ssh/sshd_config.d/hardening
#
# Redémarrage du serveur.
sudo service ssh restart
fi









