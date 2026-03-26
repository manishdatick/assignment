resource "azurerm_automation_software_update_configuration" "update_management" {
  name                 = var.name
  automation_account_id = var.automation_account_id

  schedule {
    frequency  = "Week"
    interval   = 1
    time_zone  = var.time_zone
    start_time = var.start_time
  }

  linux {
    classifications_included = ["Security"]
    excluded_packages        = ["apt"]
    included_packages        = ["vim"]
    reboot                   = "IfRequired"
  }

  virtual_machine_ids = var.vm_ids
}
