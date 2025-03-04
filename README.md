# Infrastructure and Configuration Management Project

This project sets up a complete infrastructure using Terraform, Ansible, and HashiCorp Vault.

## Directory Structure

```
/
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
├── ansible/
│   ├── site.yml
│   └── roles/
│       ├── common/
│       │   └── tasks/
│       │       └── main.yml
│       └── web_app/
│           └── tasks/
│               └── main.yml
├── vault/
│   ├── config.hcl
│   └── setup.sh
└── README.md
```

## Components

1. **Terraform (infra/)**
   - Sets up AWS infrastructure including VPC, ECS, Load Balancer, and monitoring.

2. **Ansible (ansible/)**
   - Configures servers with common settings and deploys the web application.

3. **Vault (vault/)**
   - Manages secrets and provides secure access to sensitive information.

## Setup Instructions

1. **Terraform**
   - Navigate to the `infra/` directory.
   - Run `terraform init` to initialize Terraform.
   - Run `terraform apply` to create the infrastructure.

2. **Ansible**
   - Update the inventory file with your server details.
   - Run `ansible-playbook -i inventory site.yml` to configure servers and deploy the application.

3. **Vault**
   - Navigate to the `vault/` directory.
   - Run `./setup.sh` to install and initialize Vault.
   - Follow the prompts to unseal Vault and set up initial access.

## Security Note

Ensure that sensitive information such as AWS credentials, Vault tokens, and unseal keys are stored securely and not committed to version control.

## Maintenance

Regular updates and security patches should be applied to all components. Monitor logs and performance metrics to ensure optimal operation of the infrastructure.

For more detailed information on each component, refer to the README files in their respective directories.