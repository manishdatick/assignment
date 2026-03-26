output "subnet_ids" {
  value = { for k, s in azurerm_subnet.subnet : k => s.id }
}

output "subnet_id" {
  value = try(values(azurerm_subnet.subnet)[0].id, null)
}
