# Vault Setup Guide

This guide describes how to set up and configure the self-hosted HashiCorp Vault for our project.

## Prerequisites

- A Linux server (e.g., Ubuntu 20.04 LTS)
- Root or sudo access
- Internet connectivity for downloading Vault

## Installation

1. Download and install Vault:
   ```
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
   sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   sudo apt-get update && sudo apt-get install vault
   ```

2. Verify the installation:
   ```
   vault --version
   ```

## Initial Configuration

1. Create a configuration file `/etc/vault.d/vault.hcl`:
   ```hcl
   storage "file" {
     path = "/opt/vault/data"
   }

   listener "tcp" {
     address     = "0.0.0.0:8200"
     tls_disable = 1  # Enable TLS in production
   }

   api_addr = "http://127.0.0.1:8200"
   ui       = true
   ```

2. Create the data directory:
   ```
   sudo mkdir -p /opt/vault/data
   sudo chown -R vault:vault /opt/vault/data
   ```

3. Start the Vault service:
   ```
   sudo systemctl start vault
   sudo systemctl enable vault
   ```

## Initializing and Unsealing Vault

1. Initialize Vault:
   ```
   vault operator init
   ```
   This will generate root tokens and unseal keys. Securely store these!

2. Unseal Vault (repeat 3 times with different keys):
   ```
   vault operator unseal
   ```

## Setting Up Authentication Methods

1. Enable the userpass auth method:
   ```
   vault auth enable userpass
   ```

2. Create a policy (e.g., `admin-policy.hcl`):
   ```hcl
   path "secret/*" {
     capabilities = ["create", "read", "update", "delete", "list"]
   }
   ```

3. Write the policy:
   ```
   vault policy write admin admin-policy.hcl
   ```

4. Create a user:
   ```
   vault write auth/userpass/users/admin password=<password> policies=admin
   ```

## Configuring Secrets Engines

1. Enable the KV secrets engine:
   ```
   vault secrets enable -path=secret kv-v2
   ```

2. Store a secret:
   ```
   vault kv put secret/myapp/config api_key=123456789
   ```

3. Retrieve a secret:
   ```
   vault kv get secret/myapp/config
   ```

## Best Practices

1. Use TLS in production environments.
2. Implement proper access controls and policies.
3. Regularly rotate root tokens and encryption keys.
4. Set up audit logging.
5. Implement high availability for production use.

## Troubleshooting

- Check Vault logs: `sudo journalctl -u vault`
- Verify Vault status: `vault status`
- Ensure proper permissions on Vault files and directories

For more detailed information, refer to the [HashiCorp Vault documentation](https://www.vaultproject.io/docs).