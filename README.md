# NextToTheCloud 🚀

Automated deployment dedicated to hosting a Nextcloud service written in Bash.

📢 Note: This project, known as nextcloud_install_production, has been renamed to dissociate it from the official Nextcloud server in order to avoid confusion and copyright issues.


## 🤓 Group members : 
* Joss Lenoir
* Etienne Chamarier


 ## 🛠 Technical choices : 
* Ubuntu 23.10

## 🤬 Challenges encountered : 
* Retrieval of Nextcloud connection address
* Configuration of mod_security

## 🤩 Solutions found : 
* Nextcloud: Installation of the dnsutils package to retrieve the address via WANIP4
* mod_security: Incorrect configuration of the configuration file which was duplicating.
  
## 🧪 Tests conducted : 
* Apache2 : Apache2: Verification of the status 'systemctl status apache2' and logs 'sudo journalctl -xeu apache2'
* UFW : Verification of the status 'systemctl status UFW'
* Hardening : Verification of the creation of the configuration file and its contents.


## Results achieved: what worked

## Possible improvements : 
* Add progress bars to streamline the script.
* Create a NextCloud user account at the end of the script.
* Simplify script usage (simplify script execution).
* Create a DNS and SSL certificate compliant (Let's Encrypt).
* Adapt the script for other configurations such as Windows.
