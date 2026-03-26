variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "ssh_public_key" {}
variable "subnet_id" {}
variable "nsg_id" {}

variable "os_disk_caching" {
  type    = string
  default = "ReadWrite"
}

variable "os_disk_storage_account_type" {
  type    = string
  default = "Standard_LRS"
}

variable "source_image_publisher" {
  type    = string
  default = "Canonical"
}

variable "source_image_offer" {
  type    = string
  default = "0001-com-ubuntu-server-focal"
}

variable "source_image_sku" {
  type    = string
  default = "20_04-lts"
}

variable "source_image_version" {
  type    = string
  default = "latest"
}

variable "tags" {
  type    = map(string)
  default = {}
}

