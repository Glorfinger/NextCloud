# NextToTheCloud

Déploiement automatisé dédié à l’hébergement d’un service Nextcloud écrit en Bash.

📢 Note: Ce projet connu sous le nom de nextcloud_install_production a été renommé pour le dissocier du serveur Nextcloud officiel dans le but d’éviter les confusions et droit d’auteur.


Apache.sh
 - installation apache2
 - Config apache2 :
    - a2enmod rewrite
    - a2enmod headers
    - a2enmod env
    - a2enmod dir
    - a2enmod mime
    - a2enmod ssl
    - a2ensite default-ssl

Hardening.sh 
 - configuration du fichier sshd_config.d

ufw.sh
 - installation d'ufw
 - configuration de ports (ssh, http, https)

NextCloud.sh
 - Installation MariaBD-server
 - libapache2-mod-php8.2
 - imagemagick
 - php8.2-gd
 - php8.2-mysql
 - php8.2-curl
 - php8.2-mbstring
 - php8.2-intl
 - php8.2-imagick
 - php8.2-xml
 - php8.2-zip
 - php8.2-apcu
 - redis-server
 - php8.2-redis
 - php8.2-ldap
 - smbclient
 - php8.2-bcmath
 - php8.2-gmp
