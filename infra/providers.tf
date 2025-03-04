# providers.tf

provider "aws" {
  region = var.aws_region
}

provider "vault" {
  # Vault provider configuration
  # This will be configured later when we set up Vault
}

# You might want to add more providers here in the future, such as:
# provider "kubernetes" {
#   # Kubernetes provider configuration
# }

# provider "helm" {
#   # Helm provider configuration
# }