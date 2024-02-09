## Prérequisites : 
* a functionnal terminal
* GIT . (GIT installation : $ sudo apt install git-all)

## Retrieving the script : 

$ git clone https://github.com/Glorfinger/NextCloud.git

* HTTPS : 'https://github.com/Glorfinger/NextCloud.git'
* SSH : 'git@github.com:Glorfinger/NextCloud.git'

## Configuring ports with UFW: 
* Press Enter to select port 22, otherwise define another port.  
' sudo sed -i "s/^\(Port \)[0-9]\+/\1$ssh_port/" /etc/ssh/sshd_config ' 

* Press Enter to select port 80, otherwise define another port.  
' sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$http_port/" /etc/apache2/sites-enabled/000-default.conf '

* Press Enter to select port 443, otherwise define another port.  
' sudo sed -i "s/^\(<VirtualHost \*\):\([0-9]\+\)/\1:$https_port/" /etc/apache2/sites-enabled/default-ssl.conf '

## Creating the MariaDB account and its database.
* Enter the username you want to use to connect to the MariaDB server.   
' read -p "Choisissez un nom d'utilisateur : " DB_USER '

* Enter the password associated with your MariaDB account.  
' read -p "Choisissez un mot de passe : " DB_PASSWORD ' 

* Enter the name of the database you want to link to NextCloud.    
' read -p "Choisissez un nom de base de données : " DB_NAME '

## Retrieving the NextCloud connection link.
At the end of the script, you will find a link to copy and paste into your browser to go directly to the NextCloud service.
Example: Access your Nextcloud using the address: 'http://111.11.1.1:11/nextcloud'
     
