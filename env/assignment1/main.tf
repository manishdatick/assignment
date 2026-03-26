
resource "azurerm_resource_group" "rg-mk" {
  name     = "${var.resource_group_name}-${var.env}"
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  vnet_name           = "${var.vnet_name}-${var.env}"
  address_space       = var.address_space
  subnet_name         = "${var.subnet_name}-${var.env}"
  subnet_prefix       = var.subnet_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
}

module "nsg" {
  source              = "../../modules/nsg"
  nsg_name            = "nsg-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  security_rules      = var.nsg_security_rules
}

module "vm" {
  source              = "../../modules/vm"
  vm_name             = "vm-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg-mk.name
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  ssh_public_key      = file(var.ssh_public_key_path)
  subnet_id           = module.vnet.subnet_id
  nsg_id              = module.nsg.nsg_id

}
