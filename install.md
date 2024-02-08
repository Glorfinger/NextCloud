## Prérequisites : 
* a functionnal terminal
* GIT . (GIT installation : $ sudo apt install git-all)

## Retrieving the script : 

$ git clone https://github.com/Glorfinger/NextCloud.git

* HTTPS : 'https://github.com/Glorfinger/NextCloud.git'
* SSH : 'git@github.com:Glorfinger/NextCloud.git'

## Configuration des ports avec UFW : 
* Appuyer sur Entrée pour séléctionner le port 22, sinon définissez un autre port.  
' sudo sed -i "s/^\(Port \)[0-9]\+/\1$ssh_port/" /etc/ssh/sshd_config ' 

* Appuyer sur Entrée pour séléctionner le port 80, sinon définissez un autre port.  
' sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/" /etc/apache2/sites-enabled/000-default.conf '

* Appuyer sur Entrée pour séléctionner le port 443, sinon définissez un autre port.  
' sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$https_port/" /etc/apache2/sites-enabled/default-ssl.conf '

## Création du compte MariaDB et sa BDD.
* Entrer le nom d'utilisateur que vous souhaitez utiliser pour vous connecter au serveur MariaDB  
' read -p "Choisissez un nom d'utilisateur : " DB_USER '

* Entrer le password lié à votre compte MariaDB  
' read -p "Choisissez un mot de passe : " DB_PASSWORD ' 

* Entrer le nom de la base de donnée que vous souhaitez lier à NextCloud  
' read -p "Choisissez un nom de base de données : " DB_NAME '

## Récupération du lien de connexion à NextCloud.
En fin de script vous retrouverez un lien à copier/coller dans votre navigateur pour vous rendre directement sur le service NextCloud.
ex : Accédez à votre Nextcloud en utilisant l'adresse : http://111.11.1.1:11/nextcloud
     
