# Infrastructure as Code Project

## Overview
This project demonstrates a comprehensive Infrastructure as Code (IaC) setup using Terraform, Ansible, and HashiCorp Vault. It automates the deployment of a web application on AWS, including infrastructure provisioning, application deployment, and secrets management.

## Components
- **Terraform**: Manages AWS infrastructure (VPC, ECS, ALB)
- **Ansible**: Handles application deployment and configuration
- **HashiCorp Vault**: Manages secrets and credentials
- **Docker**: Containerizes the web application

## Prerequisites
- AWS Account
- Terraform (>= 0.14.0)
- Ansible
- HashiCorp Vault
- Docker
- Git

## Project Structure
```
project/
│
├── ansible/
│   ├── roles/
│   │   ├── common/
│   │   └── web_app/
│   └── site.yml
│
├── infra/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── providers.tf
│
├── vault/
│   ├── config.hcl
│   └── setup.sh
│
├── README.md
└── CONTRIBUTING.md
```

## Deployment Instructions
1. Clone the repository
2. Set up Vault:
   ```
   cd vault
   ./setup.sh
   ```
3. Configure Terraform:
   ```
   cd ../infra
   terraform init
   terraform plan
   terraform apply
   ```
4. Run Ansible playbook:
   ```
   cd ../ansible
   ansible-playbook -i inventory site.yml
   ```

## Important Notes
- Ensure all sensitive data is stored in Vault and not in version control
- Review and adjust AWS permissions as needed
- The current setup is for development; additional security measures are needed for production

## Security Considerations
- Enable TLS for Vault in production
- Use least privilege principle for AWS IAM roles
- Regularly rotate credentials and review access logs

## Customization
- Modify `variables.tf` to adjust AWS region, VPC CIDR, etc.
- Update `site.yml` to change application deployment settings

## Troubleshooting
- If Vault fails to start, check the config.hcl file and ensure proper permissions
- For AWS-related issues, verify your credentials and VPC settings

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License
[Add your chosen license here]