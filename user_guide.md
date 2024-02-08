## Introduction  
1.1 About
- 1.1 About
Welcome to the user guide for our NextCloud Script. This script is designed to configure your environment and install the NextCloud service.

1.2 Required System Configuration
- 1.2 Required System Configuration
Before installing the script, make sure your system meets the following minimum requirements:

Operating System: Linux
Have SUDO rights.  
### Installation
2.1 Download  
- 2.1 Download  
To download our script, you can directly visit https://github.com/Glorfinger/NextCloud/ and clone the repository to your machine using these links:

https: 'https://github.com/Glorfinger/NextCloud.git'
ssh: 'git@github.com:Glorfinger/NextCloud.git'  
2.2 Script Installation  
- 2.2 Script Installation  
Once the repository is cloned to your machine, navigate to the folder where you cloned the repository 'NextCloud > Script' and execute the script 'execute_script.sh'.  

⚠️ It is recommended to create a 'bashScript' folder in $HOME and then clone the repository inside.
@@ -29,18 +29,18 @@ Commands:
* ./execute_script.sh
* bash execute_script.sh
* sh execute_script.sh  
2.3 Initial Configuration  
- 2.3 Initial Configuration  
* Git installed
* Main Features  
3.1 Installation of a web service (Apache2)  
3.2 Apache2 Configuration  
- 3.1 Installation of a web service (Apache2)  
- 3.2 Apache2 Configuration  
* a2enmod
* a2ensite  
3.3 Hardening Configuration  
- 3.3 Hardening Configuration  
For hardening configuration, we have created a configuration file in '/etc/ssh/sshd_config.d/hardening.conf'.  
⚠️ Each time the script is used, the Hardening file will be reset.

### Hardening Configuration:
## Hardening Configuration:

* PermitRootLogin no
* MaxAuthTries 3
@@ -52,12 +52,12 @@ For hardening configuration, we have created a configuration file in '/etc/ssh/s
* X11Forwarding no
* PermitUserEnvironment no
* DebianBanner no  
3.4 UFW Installation  
- 3.4 UFW Installation  
UFW installation to configure the firewall.  
⚠️ When installing ufw, you will be prompted to enter the ports you wish to use for SSH, HTTP, and HTTPS.  

3.5 Installation of a Self-Signed Certificate.  
- 3.5 Installation of a Self-Signed Certificate.  
Installation of OpenSSL to manage the creation of SSL certificates. If you forget to note the key, you can navigate to the autosigned.key file ($HOME/autosigned.key) to retrieve your key.  

3.6 NextCloud Download  
- 3.6 NextCloud Download  
User rights and Nextcloud installation path are configured during download. A /etc/apache2/sites-available/nextcloud.conf file is created and configured, then the database is created.
