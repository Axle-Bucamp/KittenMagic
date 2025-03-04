# providers.tf

provider "aws" {
  region = var.region

  # Use Vault to retrieve AWS credentials
  assume_role {
    role_arn = data.vault_aws_access_credentials.aws_creds.role_arn
  }
}

provider "vault" {
  # Configure the Vault provider
  address = "http://localhost:8200"
  # Token should be retrieved securely, e.g., from an environment variable
  token = var.vault_token
}

data "vault_aws_access_credentials" "aws_creds" {
  backend = "aws"
  role    = "deploy-role"
}

# Optionally, add Proxmox provider if needed
# provider "proxmox" {
#   pm_api_url = var.proxmox_api_url
#   pm_user    = var.proxmox_user
#   pm_password = var.proxmox_password
#   pm_tls_insecure = true
# }

# Add any other necessary providers here