Azure Terraform Modular Infrastructure : Assignment 1

Objective : Deploy a secure Linux web server (NGINX) using reusable Terraform modules on Microsoft Azure.

***********Project Structure*********** 
 modules/
    >> vnet/       # Virtual Network + Subnet module
    >> nsg/        # Network Security Group module
    >> vm/         # Linux VM with NGINX + public IP
main.tf                 # Root configuration to call modules
variables.tf            # Input variables
terraform.tfvars        # Variable values
output.tf              # Output public IP
README.md              # This documentation
provider.tf            # Azure provider configuration   


********🛠 Modules Overview*********

vnet/
Creates a virtual network and a subnet.
Inputs: vnet_name, address_space, subnet_name, subnet_prefix, location, resource_group_name
Outputs: subnet_id


nsg/
Creates a Network Security Group. Inbound ports such as 22 (SSH) and 80 (HTTP) are controlled through `nsg_security_rules` in `terraform.tfvars`.
Inputs:nsg_name, location, resource_group_name, security_rules
Outputs:nsg_id


vm/
Deploys a Linux VM, installs NGINX using cloud-init, and associates NSG.
Inputs:vm_name, location, vm_size, admin_username, ssh_public_key, subnet_id, nsg_id, resource_group_name
Outputs:public_ip

********Usage Instructions*********

1.Prerequisites>>>
  Azure CLI logged in (az login)
  Terraform installed
  SSH key generated (~/.ssh/id_rsa.pub)

2. Initialize and Apply Terraform>>>

terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
terraform destroy -var-file="terraform.tfvars" # To clean up resources

3. Access the VM>>>
  After deployment, get the public IP from the output. 
  
  Use Command >> terraform output public_ip_address
  SSH into the VM using:
  ssh <admin_username>@<public_ip>

  Access NGINX via: http://<public_ip>



