variable "name" {}
variable "location" {}
variable "resource_group_name" {}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "sku" { default = "PerGB2018" }
variable "retention_in_days" { default = 30 }

