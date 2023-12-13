

# resource "azurerm_resource_group" "rg2" {
#   name = "RG1"
#   location = "westus"
# }

# resource "azurerm_virtual_network" "vnet-001" {
#   name                = "vnet-001"
#   address_space       = var.address_space
#   location            = data.azurerm_resource_group.rg2.location
#   resource_group_name = data.azurerm_resource_group.rg2.name
# }


# resource "azurerm_public_ip" "ip" {
#   name                = "ip"
#   resource_group_name = data.azurerm_resource_group.rg2.name
#   location            = data.azurerm_resource_group.rg2.location
#   allocation_method   = var.allocation_method 

  
# }

# resource "azurerm_subnet" "subnet-vnet-001" {
#   name                 = "internal"
#   resource_group_name  = data.azurerm_resource_group.rg2.name
#   virtual_network_name = azurerm_virtual_network.vnet-001.name
#   address_prefixes     = var.address_prefixes
# }

# resource "azurerm_network_interface" "nic" {
#   name                = "nic"
#   location            = data.azurerm_resource_group.rg2.location
#   resource_group_name = data.azurerm_resource_group.rg2.name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.subnet-vnet-001.id
#     private_ip_address_allocation = var. private_ip_address_allocation
#     public_ip_address_id          = azurerm_public_ip.ip.id
#   }
# }
# resource "azurerm_network_security_group" "nsg-001" {
#   name                = "nsg-001"
#   location            = data.azurerm_resource_group.rg2.location
#   resource_group_name = data.azurerm_resource_group.rg2.name

#   security_rule {
#     name                       = "test123"
#     priority                   = var.priority
#     direction                  = var.direction
#     access                     = var.access
#     protocol                   = var.protocol 
#     source_port_range          = var.source_port_range   
#     destination_port_range     = var.destination_port_range
#     source_address_prefix      = var.source_address_prefix
#     destination_address_prefix = var.destination_address_prefix
#   }

  
# }

# resource "azurerm_windows_virtual_machine" "vm-001" {
#   count= 2
#   name                = "vm-001"
  
#   resource_group_name = data.azurerm_resource_group.rg2.name
#   location            = data.azurerm_resource_group.rg2.location
#   size                = var.size
#   admin_username      = var.admin_username
#   admin_password      = var.password
#   network_interface_ids = [
#     azurerm_network_interface.nic.id,
#   ]
  

#   os_disk {
#     caching              = var.caching
#     storage_account_type = var.storage_account_type
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2016-Datacenter"
#     version   = "latest"
#   }
#   #linux machine
# }

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

 
}