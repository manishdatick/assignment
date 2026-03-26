resource "azurerm_automation_account" "automation-account" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_log_analytics_linked_service" "automation_linked_service_with_ws" {
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  read_access_id      = azurerm_automation_account.automation-account.id
}
