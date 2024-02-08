## Prérequis : 
* un terminal fonctionnel
* GIT . (Installation GIT : $ sudo apt install git-all)

## Récupération du script : 

$ git clone https://github.com/Glorfinger/NextCloud.git

* HTTPS : 'https://github.com/Glorfinger/NextCloud.git'
* SSH : 'git@github.com:Glorfinger/NextCloud.git'

## Modules installés :

### - Apache.sh
- Configuration apache2 :
 * a2enmod rewrite (https://httpd.apache.org/docs/2.4/mod/mod_rewrite.html)
 * a2enmod headers (https://httpd.apache.org/docs/2.4/mod/mod_headers.html)
 * a2enmod env (https://httpd.apache.org/docs/2.4/mod/mod_env.html)
 * a2enmod dir (https://httpd.apache.org/docs/2.4/mod/mod_dir.html)
 * a2enmod mime (https://httpd.apache.org/docs/2.4/mod/mod_mime.html)
 * a2enmod ssl (https://httpd.apache.org/docs/2.4/mod/mod_ssl.html)
 * a2ensite default-ssl

### - Hardening.sh
- Configuration fichier Hardening :
  * 'PermitRootLogin no' -- Interdit la connexion au 'root' via le SSH.
  * 'MaxAuthTries 3' -- Limite le nombre de tentatives d'authentification en SSH à 3.
  * 'LoginGraceTime 20' -- Période de 20 secondes pendant lesquelles l'utilisateur doit se connecter après avoir établi sa connexion SSH.
  * 'PermitEmptyPasswords no' -- Empêche la connexion avec des mots de passe vides.
  * 'PasswordAuthentication no' -- Désaction l'authentification par mot de passe.
  * 'ChallengeResponseAuthentication no' -- Désactive l'authenfication basée sur les défis. (séries de questions visant à prouver son identité) - https://www.techtarget.com/searchsecurity/definition/challenge-response-system
  * 'KerberosAuthentication no' -- Désactive l'authentification Kerberos (protocole d'authentification). - 'https://www.varonis.com/blog/kerberos-authentication-explained'
  * 'X11Forwarding no' -- Désactive la possibilité de transférer les connexions X11. - 'https://goteleport.com/blog/x11-forwarding/'
  * 'PermitUserEnvironment no' -- Interdit la personnalisation de l'environnement.
  * 'DebianBanner no' -- Supprime l'affichage de la bannière Debian lors de la connexion.


### - Ufw.sh
 - Configuration des ports :
   * ssh
   * http
   * https

### - NextCloud.sh
 - Installation des packages
   * mariadb-server
   * php8.2
   * php8.2-common
   * php8.2-curl
   * php8.2-gd
   * php8.2-intl
   * php8.2-mbstring
   * php8.2-xmlrpc
   * php8.2-mysql
   * php8.2-xml
   * php8.2-cli
   * php8.2-zip
   * wget
   * unzip
   * dnsutils
     
 - Telechargement de Nextcloud
   * https://download.nextcloud.com/server/releases/latest.zip
     
