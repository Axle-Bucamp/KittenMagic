# Ansible Usage Guide

This guide provides instructions on running and modifying the Ansible playbook for our project.

## Prerequisites

- Ansible 2.9 or later
- Python 3.6 or later
- Access to target servers (SSH keys configured)
- Vault access for retrieving secrets (if applicable)

## Running the Playbook

1. Navigate to the `ansible` directory:
   ```
   cd ansible
   ```

2. Run the playbook:
   ```
   ansible-playbook -i inventory/production deploy_web_app.yml
   ```

   Replace `inventory/production` with the appropriate inventory file for your environment.

## Key Roles and Tasks

Our Ansible configuration includes the following main roles:

1. `common`: Sets up basic server configuration
2. `web_app`: Deploys and configures the web application
3. `monitoring`: Sets up monitoring tools (if applicable)

Review the `roles` directory for detailed tasks within each role.

## Modifying the Playbook

To modify the playbook for different environments:

1. Create or edit environment-specific inventory files in the `inventory` directory.
2. Use group_vars and host_vars to set environment-specific variables.
3. Modify the `deploy_web_app.yml` playbook to include or exclude roles as needed.

## Managing Secrets

We use HashiCorp Vault for managing secrets. Ensure you have the necessary permissions and have configured Ansible to interact with Vault.

1. Use the `ansible-vault` command to encrypt sensitive files.
2. Use the `lookup('hashi_vault', ...)` plugin to retrieve secrets from Vault in your playbooks.

## Best Practices

1. Always test changes in a staging environment before applying to production.
2. Use version control for your Ansible code.
3. Regularly update Ansible and its dependencies.
4. Use roles and include files to keep your playbooks DRY (Don't Repeat Yourself).
5. Document any custom modules or filters.

## Troubleshooting

If you encounter issues:
1. Use the `-vvv` flag for verbose output when running playbooks.
2. Check the Ansible configuration file (`ansible.cfg`) for any custom settings.
3. Verify SSH connectivity to target hosts.
4. Ensure Vault access and secrets are correctly configured.

For more information, refer to the [Ansible documentation](https://docs.ansible.com/).