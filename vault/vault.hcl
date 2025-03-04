# Vault Server Configuration

# Storage configuration
storage "file" {
  path = "/vault/data"
}

# Listener configuration
listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1  # Disable TLS for local development. Enable and configure properly for production.
}

# API address
api_addr = "http://127.0.0.1:8200"

# UI configuration
ui = true

# Plugin directory
plugin_directory = "/vault/plugins"

# Enable the AWS secrets engine
plugin "aws" {
  path = "aws"
}

# Enable the KV secrets engine
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Enable userpass auth method
auth "userpass" {
}

# Disable mlock
disable_mlock = true

# Log level
log_level = "info"

# Enable telemetry for monitoring
telemetry {
  statsite_address = "127.0.0.1:8125"
  disable_hostname = true
}