#!/bin/bash

# Update the apt package index
sudo apt update

# Install unzip (if not already installed)
sudo apt install -y unzip

# Download the latest version of Vault
VAULT_VERSION=$(curl -s https://releases.hashicorp.com/vault/ | grep -oP 'href="/vault/[0-9]+\.[0-9]+\.[0-9]+/"' | head -n 1 | grep -oP '[0-9]+\.[0-9]+\.[0-9]+')
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -O vault.zip

# Unzip the Vault binary
unzip vault.zip

# Move the Vault binary to /usr/local/bin
sudo mv vault /usr/local/bin/

# Verify Vault installation
vault --version
