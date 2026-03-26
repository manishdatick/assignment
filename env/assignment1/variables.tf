variable "location" {
  default = "France Central"
}

variable "resource_group_name" {
  default = "terraform-rg"
}

variable "subscription_id" {
  description = "Azure subscription ID. Should be set via tfvars, not hardcoded."
  type        = string
}

variable "vm_size" {
  default = "Standard_B1s"
}

variable "admin_username" {
  default = "azureuser"
}


variable "ssh_public_key_path" {
  description = "Path to your SSH public key file"
  default     = "~/.ssh/id_rsa.pub"
}

variable "env" {
  default = "dev"
}



variable "address_space" {
}



variable "subnet_prefix" {
}

variable "nsg_security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = []
}

variable "subnet_name" {
}

variable "vnet_name" {

}

