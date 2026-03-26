variable "name" {}
variable "location" {}
variable "sku_name" { default = "Free" }
variable "log_analytics_workspace_id" {}

variable "resource_group_name" {}

variable "tags" {
  type    = map(string)
  default = {}
}

