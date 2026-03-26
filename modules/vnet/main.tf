resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

locals {
  subnet_definitions = length(var.subnets) > 0 ? var.subnets : [
    {
      name   = var.subnet_name
      prefix = var.subnet_prefix
    }
  ]
}

resource "azurerm_subnet" "subnet" {
  for_each            = { for s in local.subnet_definitions : s.name => s }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes    = [each.value.prefix]
}