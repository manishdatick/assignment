output "public_ip_addresses" {
  value = { for name, vm in module.vm : name => vm.public_ip }
}

output "vm_ids" {
  value = { for name, vm in module.vm : name => vm.vm_id }
}
