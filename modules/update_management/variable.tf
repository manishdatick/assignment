variable "name" {}
variable "automation_account_id" {}
variable "time_zone" {
  type    = string
  default = "India Standard Time"
}
variable "start_time" {}
variable "vm_ids" {
  type = list(string)
}