
locals {
  name_prefix = "${var.resource_group_name}-${var.env}"
}

resource "azurerm_resource_group" "rg-mk" {
  name     = local.name_prefix
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "${var.vnet_name}-${var.env}"
  address_space       = var.address_space
  subnet_name         = "${var.subnet_name}-${var.env}"
  subnet_prefix       = var.subnet_prefix
  subnets             = var.subnets
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  tags                = var.tags
}

module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = "${local.name_prefix}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  security_rules      = var.nsg_security_rules
  tags                = var.tags
}

module "vm" {
  for_each            = var.vms
  source              = "../../modules/vm"
  vm_name             = each.value.vm_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  vm_size             = each.value.vm_size
  admin_username      = each.value.admin_username
  ssh_public_key      = file(each.value.ssh_public_key)
  subnet_id           = lookup(module.vnet.subnet_ids, each.value.subnet_name, module.vnet.subnet_id)
  nsg_id              = module.nsg.nsg_id
  tags                = var.tags

}

# Challange 2


module "log_analytics" {
  source              = "../../modules/log_analytics"
  name                = "log-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  tags                = var.tags
}

module "automation_account" {
  source                     = "../../modules/automation_account"
  name                       = "auto-${var.env}"
  location                   = var.location
  resource_group_name        = azurerm_resource_group.rg-mk.name
  log_analytics_workspace_id = module.log_analytics.workspace_id
  tags                       = var.tags
}

module "update_management" {
  source                = "../../modules/update_management"
  name                  = "patch-${var.env}"
  automation_account_id = module.automation_account.automation_account_id
  time_zone             = var.time_zone
  vm_ids                = [for vm in module.vm : vm.vm_id]
  start_time            = var.schedule_start_time

}
