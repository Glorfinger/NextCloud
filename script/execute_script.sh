#!/bin/bash

# Chemin vers le dossier contenant les scripts
script_folder="~/bashScript/NextCloud/script"

# Exécution des scripts dans l'ordre
echo "Exécution du script : apache.sh"
sudo bash "$script_folder/apache.sh"

echo "Exécution du script : hardening.sh"
sudo bash "$script_folder/hardening.sh"

echo "Exécution du script : ufw.sh"
sudo bash "$script_folder/ufw.sh"
