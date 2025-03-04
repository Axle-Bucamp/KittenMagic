# Secure Web Application Deployment Project

## Overview

This project provides a comprehensive solution for deploying a secure web application using Terraform, Ansible, and HashiCorp Vault. It sets up a robust infrastructure on AWS, including VPC configuration, ECS cluster deployment, and application load balancing, while ensuring secure management of sensitive data.

## Components

1. **Terraform**: Manages AWS infrastructure
   - VPC with public and private subnets
   - ECS Cluster
   - Application Load Balancer
   - Security Groups

2. **Ansible**: Handles application deployment and configuration
   - Web server setup
   - Nginx configuration
   - SSL/TLS setup with Let's Encrypt

3. **HashiCorp Vault**: Manages secrets and sensitive data
   - AWS credentials
   - Database credentials
   - Other application secrets

4. **Docker**: Containerizes the web application

## Prerequisites

- AWS Account
- Terraform (>= 0.14.0)
- Ansible
- Docker
- HashiCorp Vault
- AWS CLI

## Project Structure

```
project/
├── ansible/
│   ├── playbooks/
│   │   └── deploy_web_app.yml
│   └── roles/
│       ├── common/
│       └── web_app/
│           └── templates/
│               └── nginx.conf.j2
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
├── vault/
│   ├── config.hcl
│   └── setup.sh
└── README.md
```

## Deployment Instructions

1. **Set up Vault**:
   ```
   cd vault
   ./setup.sh
   ```

2. **Configure AWS credentials**:
   ```
   aws configure
   ```

3. **Initialize Terraform**:
   ```
   cd infra
   terraform init
   terraform plan
   terraform apply
   ```

4. **Run Ansible playbook**:
   ```
   cd ../ansible
   ansible-playbook playbooks/deploy_web_app.yml
   ```

## Important Notes

- Ensure all sensitive data is stored in Vault and not in code repositories.
- The provided Vault configuration is for development. Use a production-ready setup for live environments.
- Always use the latest stable versions of Terraform, Ansible, and Vault.
- Regularly update and patch all components of the infrastructure.

## Security Considerations

- Enable and properly configure SSL/TLS for all communications.
- Use strong authentication methods for Vault and AWS.
- Regularly rotate secrets and access keys.
- Implement proper network segmentation and security groups in AWS.

## Customization

- Modify `variables.tf` to adjust AWS region, VPC CIDR, and other infrastructure settings.
- Update `nginx.conf.j2` in Ansible roles to customize web server configuration.
- Adjust Vault's `config.hcl` for different secret engines or authentication methods.

## Troubleshooting

- Check Terraform and Ansible logs for detailed error messages.
- Ensure Vault is properly initialized and unsealed before running deployments.
- Verify AWS credentials and permissions are correctly set up.

## Contributing

Please read CONTRIBUTING.md for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.