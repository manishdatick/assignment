resource_group_name = "manish-central-rg"
subscription_id     = "071c7b1d-8b83-42f7-bbff-4e5ade972907" # replace with your own subscription ID
location            = "France Central"
vm_size             = "Standard_D2s_v3"
admin_username      = "azureuser"
ssh_public_key_path = "~/.ssh/id_rsa.pub"
address_space       = "10.0.0.0/16"
subnet_prefix       = "10.0.1.0/24"
vnet_name           = "vnet"
subnet_name         = "subnet"
env                 = "dev"

# Inbound rules for assignment requirement: SSH (22) and HTTP (80)
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

