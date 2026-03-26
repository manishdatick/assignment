


data "azurerm_virtual_machine" "vm" {
  name                = "vm-${var.env}"
  resource_group_name = "${var.resource_group_name}-${var.env}"
}

module "log_analytics" {
  source              = "../../modules/log_analytics"
  name                = "log-${var.env}"
  location            = var.location
  resource_group_name = "${var.resource_group_name}-${var.env}"
}

module "automation_account" {
  source                     = "../../modules/automation_account"
  name                       = "auto-${var.env}"
  location                   = var.location
  resource_group_name        = "${var.resource_group_name}-${var.env}"
  log_analytics_workspace_id = module.log_analytics.workspace_id
}

module "update_management" {
  source                = "../../modules/update_management"
  name                  = "patch-${var.env}"
  automation_account_id = module.automation_account.automation_account_id
  vm_ids                = [data.azurerm_virtual_machine.vm.id]
  time_zone             = var.schedule_time_zone
  start_time            = var.schedule_start_time

}
