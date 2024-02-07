#!/bin/bash

# Chemin vers le dossier contenant les scripts
script_folder="/home/etienne/bashScript/NextCloud/script"

# Exécution des scripts dans l'ordre
echo "Exécution du script : apache.sh"
bash "$script_folder/apache.sh"

echo "Exécution du script : hardening.sh"
bash "$script_folder/hardening.sh"

echo "Exécution du script : ufw.sh"
bash "$script_folder/ufw.sh"

echo "Exécution du script : Certif_ssl"
bash "$script_folder/certif_ssl"

echo "Exécution du script : mod_security"
bash "$script_folder/certif_ssl"

echo "Execution du script : nextcloud.sh"
bash "$script_folder/nextcloud.sh"
