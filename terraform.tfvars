

admin_username                = "adminuser1"
password                      = "ala@123@maham"
size                          = "Standard_F2"
storage_account_type          = "Standard_LRS"
caching                       = "ReadWrite"
address_space                 = ["10.0.0.0/16"]
address_prefixes              = ["10.0.2.0/24"]
priority                      = "100"
protocol                      = "Tcp"
access                        = "Allow"
direction                     = "Inbound"
source_port_range             = "*"
destination_port_range        = "*"
source_address_prefix         = "*"
destination_address_prefix    = "*"
allocation_method             = "Static"
private_ip_address_allocation = "Dynamic"
resource_group                = "rg-001"

 account_tier             = "Standard"
  account_replication_type = "GRS"
   sa_name                     = "tfacc1"
    rg_name     = "rg_01"
  location = "West Europe"