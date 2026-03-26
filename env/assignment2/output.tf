output "workspace_id" {
  value = module.log_analytics.workspace_id
}

output "automation_account_id" {
  value = module.automation_account.automation_account_id
}

output "update_configuration_name" {
  value = module.update_management.update_configuration_name
}