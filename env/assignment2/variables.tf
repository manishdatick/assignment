variable "location" { default = "France Central" }
variable "resource_group_name" { default = "terraform-rg" }
variable "env" {}
variable "schedule_start_time" {}
variable "schedule_time_zone" {
  description = "Time zone for weekly patch schedule"
  type        = string
  default     = "India Standard Time"
}
variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}