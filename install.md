## Prérequisites : 
* a functionnal terminal
* GIT . (GIT installation : $ sudo apt install git-all)

## Retrieving the script : 

$ git clone https://github.com/Glorfinger/NextCloud.git

* HTTPS : 'https://github.com/Glorfinger/NextCloud.git'
* SSH : 'git@github.com:Glorfinger/NextCloud.git'

## Configuration des ports avec UFW : 
* Configuration du port SSH, si champs vide pour 22 par défaut.  
-- sudo sed -i "s/^\(Port \)[0-9]\+/\1$ssh_port/" /etc/ssh/sshd_config****

* Configuration du port HTTP, si champs vide pour 80 par défaut.  
-- sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/" /etc/apache2/sites-enabled/000-default.conf

* Configuration du port HTTPS, si champs vide pour 443 par défaut.  
-- sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$https_port/" /etc/apache2/sites-enabled/default-ssl.conf  


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
     
