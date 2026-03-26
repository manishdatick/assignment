subscription_id     = "071c7b1d-8b83-42f7-bbff-4e5ade972907" # replace with your own subscription ID
resource_group_name = "manish-bonus-rg"
location            = "France Central"
address_space       = "10.0.0.0/16"
subnet_prefix       = "10.0.1.0/24"
vnet_name           = "vnet"
subnet_name         = "subnet"
subnets = [
  {
    name   = "subnet-1-dev"
    prefix = "10.0.1.0/24"
  }
]
###############
env                 = "dev"
schedule_start_time = "2026-03-26T01:00:00+05:30"
nsg_security_rules = [
  {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Allow-HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]

vms = {
  vm01 = {
    vm_name        = "web01-dev"
    vm_size        = "Standard_D2s_v3"
    admin_username = "azureuser"
    ssh_public_key = "~/.ssh/id_rsa.pub"
    subnet_name    = "subnet-1-dev"
  }
}

tags = {
  environment = "dev"
  project     = "terraform-assignment"
}
