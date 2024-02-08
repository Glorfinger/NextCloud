# NextToTheCloud 🚀

Déploiement automatisé dédié à l’hébergement d’un service Nextcloud écrit en Bash.

📢 Note: Ce projet connu sous le nom de nextcloud_install_production a été renommé pour le dissocier du serveur Nextcloud officiel dans le but d’éviter les confusions et droit d’auteur.


## 🤓 Les membres du groupe : 
* Joss Lenoir
* Etienne Chamarier


 ## 🛠 Choix techniques : 
* Ubuntu 23.10

## 🤬 Difficultés rencontrées : 
* Récupération de l'addresse de connexion à Nextcloud
* Paramétrage du mod_security

## 🤩 Solutions trouvées : 
* Nextcloud : Installation du package dnsutils pour recupérer l'adresse via WANIP4
* mod_security : Mauvais paramétrage du fichier de configuration qui se dupliquait. 

## 🧪 Tests réalisés : 
* Apache2 : Vérification du status 'systemctl status apache2' et des logs 'sudo journalctl -xeu apache2'
* UFW : Vérification du status 'systemctl status UFW'
* Hardening : Vérification de la création du fichier de configuration et de son contenu.



## Résultats obtenus : ce qui a fonctionné

## Améliorations possibles : 
* Ajouter des progress_bar pour fludifier le script.
* Création d'un compte utilisateur NextCloud en fin de script
* Simplifier l'utilisation du script. (simplifier le lancement du script)
* Création d'un DNS et d'un certificat SSL conforme (Let's Encrypt)
* Adapter le script pour d'autres configurations type windows


* Apache.sh
 - installation apache2

* Hardening.sh 
 - configuration du fichier sshd_config.d

* ufw.sh
 - installation d'ufw

* certif_ssl.sh
  - création d'un certificat ssl auto-signé

NextCloud.sh
 - installation du service et ses dépendances
