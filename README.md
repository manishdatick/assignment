# Azure Infrastructure as Code with Terraform

This repository contains Terraform configurations for deploying Azure infrastructure across multiple assignments, demonstrating modular IaC practices for VM deployments, networking, and patch management.

## Project Structure

```
.
├── modules/                    # Reusable Terraform modules
│   ├── automation_account/    # Azure Automation Account
│   ├── log_analytics/         # Log Analytics Workspace
│   ├── nsg/                   # Network Security Group
│   ├── update_management/     # Update Management Configuration
│   ├── vm/                    # Virtual Machine
│   └── vnet/                  # Virtual Network and Subnet
├── env/                       # Environment-specific configurations
│   ├── assignment1/           # Assignment 1: Basic VM and Networking
│   ├── assignment2/           # Assignment 2: Patch Management
│   └── bonuschallenge/        # Bonus Challenge: Full Environment
└── README.md                  # This file
```

## Assignments Overview

### Assignment 1: Basic VM and Networking
Deploys a Linux VM with NGINX in a secure network environment.
- Virtual Network and Subnet
- Network Security Group with configurable rules
- Ubuntu VM with SSH access (password disabled)
- Cloud-init for NGINX installation

### Assignment 2: Patch Management
Sets up automated patch management for VMs using Azure Automation.
- Log Analytics Workspace
- Automation Account
- Update Management configuration with weekly schedules
- Dynamically references VM from Assignment 1

### Bonus Challenge: Full Environment
Comprehensive infrastructure deployment with multiple VMs.
- All components from Assignment 1
- Multiple VMs with for_each
- Integrated patch management
- Environment-based naming and tagging
- **Can be run independently** — does not require Assignment 1 or 2 to be deployed first. It creates its own resource group, networking, VMs, and patch management from scratch.

## Prerequisites

- Azure CLI installed and authenticated
- Terraform 1.10.5+
- Azure subscription with appropriate permissions

## Usage

1. **Clone and navigate to the repository**
   ```bash
 
   ```

2. **Initialize Terraform (per environment)**
   ```bash
   cd env/assignment1
   terraform init
   ```

3. **Update variables in `terraform.tfvars`**
   - Set your resource group name
   - Configure environment-specific settings

4. **Deploy infrastructure**
   ```bash
   terraform plan
   terraform apply
   ```

5. **For Assignment 2, ensure Assignment 1 is deployed first** (as it references the VM)

## Key Features

- **Modular Design**: Reusable modules for consistent deployments
- **Dynamic Configuration**: No hardcoded values, fully parameterized
- **Security Best Practices**: SSH-only access, configurable NSGs
- **Scalability**: Support for multiple VMs via for_each
- **Automation**: Integrated patch management and monitoring

## Modules

Each module is self-contained with inputs and outputs under the `modules/` directory and is consumed by the environment configurations under `env/`.

## Environment Variables

Set the following if needed:
- `ARM_SUBSCRIPTION_ID`: Azure subscription ID
- `ARM_CLIENT_ID`: Service principal client ID
- `ARM_CLIENT_SECRET`: Service principal secret
- `ARM_TENANT_ID`: Azure tenant ID

## Cleanup

To destroy resources:
```bash
terraform destroy
```

**Note**: Destroy in reverse order (Assignment 2 first, then 1, then Bonus Challenge) to avoid dependency issues.

## Important: Deprecation Notice
> **Azure Automation Update Management was deprecated on 31st August 2024 and has been shut down on 28th February 2025.**
> Microsoft recommends migrating to **Azure Update Manager**.
> Learn more: https://aka.ms/mmaagentbasedservicesshutdown
>
> Assignment 2 and the Bonus Challenge use `azurerm_automation_software_update_configuration` for demonstration purposes. In production, use Azure Update Manager (`azurerm_maintenance_configuration`) instead.

## Contributing

This is an assignment project. For improvements, ensure changes maintain modularity and follow Terraform best practices.