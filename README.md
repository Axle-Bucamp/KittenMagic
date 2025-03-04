# Project Structure

This project contains the following directory structure:

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

## Directory Overview

- `infra/`: Contains Terraform configuration files for infrastructure management.
- `ansible/`: Contains Ansible playbooks and roles for configuration management.
- `vault/`: Contains HashiCorp Vault configuration and setup files.

Each directory and file serves a specific purpose in the project. Refer to individual files for more details on their functions and usage.