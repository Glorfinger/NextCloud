#!/bin/bash

# Chemin vers le dossier contenant les scripts
script_folder="$HOME/bashScript/NextCloud/script"

# Exécution des scripts dans l'ordre
echo "Exécution du script : apache.sh"
bash "$script_folder/apache.sh"

echo "Exécution du script : hardening.sh"
bash "$script_folder/hardening.sh"

echo "Exécution du script : ufw.sh"
bash "$script_folder/ufw.sh"

echo "Exécution du script : certif_ssl"
bash "$script_folder/certif_ssl.sh"

echo "Exécution du script : mod_security"
bash "$script_folder/mod_security.sh"

echo "Execution du script : nextcloud.sh"
bash "$script_folder/nextcloud.sh"
