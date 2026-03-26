variable "location" {
  default = "France Central"
}

variable "resource_group_name" {
  default = "terraform-rg"
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

variable "vnet_name" {

}
variable "address_space" {
}
variable "subnet_name" {

}
variable "subnet_prefix" {
}

variable "subnets" {
  type = list(object({
    name   = string
    prefix = string
  }))
  default = []
}

variable "env" {
  description = "Environment name used in all resource naming (dev, test, prod, etc.)"
  default     = "dev"
}

variable "name_prefix" {
  description = "Prefix for resource names. Usually var.env or env-var + project"
  default     = "dev"
}

variable "time_zone" { default = "Romance Standard Time" }
variable "schedule_start_time" {}

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

variable "vms" {
  type = map(object({
    vm_name        = string
    vm_size        = string
    admin_username = string
    ssh_public_key = string
    subnet_name    = string
  }))
  default = {
    vm01 = {
      vm_name        = "vm-dev-01"
      vm_size        = "Standard_B1s"
      admin_username = "azureuser"
      ssh_public_key = "~/.ssh/id_rsa.pub"
      subnet_name    = "subnet-dev"
    }
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}