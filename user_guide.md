
## Introduction
 ### 1.1 About
Welcome to the user guide for our NextCloud Script. This script is designed to configure your environment and install the NextCloud service.

 ### 1.2 System Configuration Requirements
Before installing the script, ensure that your system meets the following minimum requirements:
  * Operating System: Linux
  * SUDO rights available.

## Installation
 ### 2.1 Download
To download our script, you can directly visit https://github.com/Glorfinger/NextCloud/ and clone the repository to your machine using these links:
 * https : 'https://github.com/Glorfinger/NextCloud.git'
 * ssh : 'git@github.com:Glorfinger/NextCloud.git'

 ### 2.2 Script Installation
Once the repository is cloned to your machine, navigate to the directory where you cloned the repository 'NextCloud > Script' and execute the script 'execute_script.sh'.

⚠️It is recommended to create a 'bashScript' folder in $HOME and clone the repository inside.

If not possible, after cloning the script to your machine, please follow these steps :

* Navigate to the file execute_script.sh
* Modify the path in line 4 'script_folder="your/path/to/the/script/"
* Save the modifications.
* Run the script execute_script.sh

Commandes :
 * ./execute_script.sh
 * bash execute_script.sh
 * sh execute_script.sh

 ### 2.3 Initial Configuration
 * Git must be installed on your machine

## Main Features
 ### 3.1 Web Service Installation (Apache2)
 ### 3.2 Apache2 Configuration
  * a2enmod
  * a2ensite

 ### 3.3 Hardening Configuration
 For hardening configuration, we have created a configuration file in '/etc/ssh/sshd_config.d/hardening.conf'.   
 ⚠️ Every time the script is used, the Hardening file will be reset.

 Hardening Configuration :
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

### 3.4 UFW Installation
Installation of UFW to configure the firewall.
⚠️ During ufw installation, you will be asked to enter the port you want to use for SSH, HTTP, and HTTPS.

### 3.5 Self-signed Certificate Installation
Installation of OpenSSL to manage SSL certificate creation. If you forget to note the key, you can find it in the file autosigned.key ($HOME/autosigned.key).

### 3.6 Mod_security Installation
Installation of the mod_security package for apache2 and its configuration that can be found in '/etc/apache2/modsecurity.conf'.


### 3.7 NextCloud Download
User rights and Nextcloud installation path are configured during the download. A file '/etc/apache2/sites-available/nextcloud.conf' is created and configured, then the database is created.

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

### certif_ssl.sh
4- Installation of Openssl :
   * certh path : '/etc/ssl/nextcloud-ssl.conf/autosigned.crt'
   * key path :'/etc/ssl/nextcloud-ssl.conf/autosigned.key'

### Mod_security.sh 
5- Installation and configuration of mod_security : 
   * libapache2-mod-security2*
   * configuration : '/etc/apache2/modsecurity.conf'

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

