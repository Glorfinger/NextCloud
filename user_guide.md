
## Introduction
 ### 1.1 À propos
Bienvenue dans le guide de l'utilisateur de notre Script NextCloud. Ce script a été conçu pour configurer votre environnement et installer le service NextCloud.

 ### 1.2 Configuration système requise
Avant d'installer le script, assurez-vous que votre système répond aux exigences minimales suivantes : 
  * Systeme d'exploitation : Linux
  * Disposer des droits SUDO.

## Installation
 ### 2.1 Téléchargement
Pour télécharger notre script, vous pouvez vous rendre directement sur https://github.com/Glorfinger/NextCloud/ et cloner le repos sur votre machine en utilisant ces liens : 
 * https : 'https://github.com/Glorfinger/NextCloud.git'
 * ssh : 'git@github.com:Glorfinger/NextCloud.git'

 ### 2.2 Installation du script
Une fois le repos cloné sur votre machine, vous devez vous rendre dans le dossier où vous venez de cloner le repos 'NextCloud > Script'  et exécuter le script 'execute_script.sh'.  

⚠️Il est recommandé de créer un dossier 'bashScript' dans $HOME puis de cloner le repo à l'intérieur. 

Si ce n'est pas possible, une fois le script clone sur mon machine, veuillez suivre la démarche suivante :
* Se rendre dans le fichier execute_script.sh
* Modifier le chemin de la ligne 4 'script_folder="votre/chemin/vers/le/script/"
* Enregistrer les modifications.
* Lancer le script execute_script.sh

Commandes :
 * ./execute_script.sh
 * bash execute_script.sh
 * sh execute_script.sh

 ### 2.3 Configuration initiale
 * Git installé 

## Fonctionnalités principales 
 ### 3.1 Installation d'un service web (Apache2)
 ### 3.2 Configuration d'Apache2
  * a2enmod
  * a2ensite

 ### 3.3 Configuration du Hardening
 Pour la configuration du hardening, nous avons créer un fichier de configuration dans  '/etc/ssh/sshd_config.d/hardening.conf'.   
 ⚠️ A chaque utilisation du script, le fichier Hardening sera réinitiallisé.

 Configuration du Hardening : 
  * PermitRootLogin no
  * MaxAuthTries 3
  * LoginGraceTime 20
  * PermitEmptyPasswords no
  * PasswordAuthentication no
  * ChallengeResponseAuthentication no
  * KerberosAuthentication no
  * X11Forwarding no
  * PermitUserEnvironment no
  * DebianBanner no

### 3.4 Installation d'UFW
Installation d'UFW pour configurer le pare-feu.   
⚠️ Lors de l'installation d'ufw, il vous sera demandé de saisir le port que vous souhaitez utilisé pour SSH , HTTP et HTTPS. 

### 3.5 Installation d'un certification Auto signé.
Installation d'OPENSLL pour gérer la création des certificats SSL. Si vous avez oublié de noté la clé, vous pouvez vous rendre dans le fichier autosigned.key ($HOME/autosigned.key)  pour retrouver votre clé.

### 3.6 Telechargement de NextCloud
Les droits d'utilisateur et le chemin d'installation de Nextcloud sont paramétrés lors du téléchargement. Un fichier /etc/apache2/sites-available/nextcloud.conf est créé et paramétré, puis on créé la base de données.   

## Installed modules :

### Apache.sh
1- Apache2 configuration :
 * a2enmod rewrite (https://httpd.apache.org/docs/2.4/mod/mod_rewrite.html)
 * a2enmod headers (https://httpd.apache.org/docs/2.4/mod/mod_headers.html)
 * a2enmod env (https://httpd.apache.org/docs/2.4/mod/mod_env.html)
 * a2enmod dir (https://httpd.apache.org/docs/2.4/mod/mod_dir.html)
 * a2enmod mime (https://httpd.apache.org/docs/2.4/mod/mod_mime.html)
 * a2enmod ssl (https://httpd.apache.org/docs/2.4/mod/mod_ssl.html)
 * a2ensite default-ssl

### Hardening.sh
2- Hardening file configuration :
  * 'PermitRootLogin no' -- Disallows root login via SSH.
  * 'MaxAuthTries 3' -- Limits SSH authentication attempts to 3.
  * 'LoginGraceTime 20' -- 20-second period during which the user must login after establishing an SSH connection.
  * 'PermitEmptyPasswords no' -- Prevents login with empty passwords.
  * 'PasswordAuthentication no' -- Disables password authentication.
  * 'ChallengeResponseAuthentication no' -- Disables challenge-response authentication. (series of questions to prove identity) - https://www.techtarget.com/searchsecurity/definition/challenge-response-system
  * 'KerberosAuthentication no' -- Disables Kerberos authentication (authentication protocol).  
  * 'https://www.varonis.com/blog/kerberos-authentication-explained'
  * 'X11Forwarding no' -- Disables the ability to forward X11 connections. - 'https://goteleport.com/blog/x11-forwarding/'
  * 'PermitUserEnvironment no' -- Disallows environment customization.
  * 'DebianBanner no' -- Suppresses Debian banner display upon login.


### Ufw.sh
3- Port configuration
   * ssh
   * http
   * https

### NextCloud.sh
4- Installation of packages :
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
     
 5- Nextcloud download :
   * https://download.nextcloud.com/server/releases/latest.zip

