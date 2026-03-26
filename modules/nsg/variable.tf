variable "nsg_name" {}
variable "location" {}
variable "resource_group_name" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "security_rules" {
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
