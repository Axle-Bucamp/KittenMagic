#!/bin/bash

# Install Vault
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install vault

# Create Vault directories
sudo mkdir -p /opt/vault/data
sudo chown -R vault:vault /opt/vault

# Copy Vault configuration
sudo cp config.hcl /etc/vault.d/

# Start Vault server
sudo systemctl enable vault
sudo systemctl start vault

# Initialize Vault (this will output root token and unseal keys)
vault operator init

echo "Vault setup complete. Please save the root token and unseal keys securely."
echo "You need to unseal Vault using the unseal keys before it can be used."