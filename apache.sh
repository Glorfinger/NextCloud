#!/bin/bash

# Function to install Apache based on the package manager
install_apache() {
    if [[ -n $(command -v apt-get) ]]; then
        sudo apt-get update
        sudo apt-get install -y apache2
    elif [[ -n $(command -v yum) ]]; then
        sudo yum update
        sudo yum install -y httpd
    else
        echo "Unsupported package manager. Exiting."
        exit 1
    fi
}

# Function to start Apache service
start_apache() {
    if [[ -n $(command -v systemctl) ]]; then
        sudo systemctl start apache2 || sudo systemctl start httpd
    else
        sudo service apache2 start || sudo service httpd start
    fi
}

# Install Apache
install_apache

# Start Apache
start_apache

# Check status of Apache (optional)
if [[ -n $(command -v systemctl) ]]; then
    sudo systemctl status apache2 || sudo systemctl status httpd
else
    sudo service apache2 status || sudo service httpd status
fi
