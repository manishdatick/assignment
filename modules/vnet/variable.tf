variable "vnet_name" {}
variable "address_space" {}
variable "subnet_name" {}
variable "subnet_prefix" {}
variable "subnets" {
  type = list(object({
    name   = string
    prefix = string
  }))
  default = []
}
variable "location" {}
variable "resource_group_name" {}

variable "tags" {
  type    = map(string)
  default = {}
}