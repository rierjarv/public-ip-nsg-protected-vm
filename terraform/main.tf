provider "azurerm" {
  features {}
}

locals {
  allowed_ip_addresses = var.allowed_ips
  prefix = concat([var.author],[var.project_name],[var.environment]) 
}

resource "azurerm_resource_group" "rg" {
  name     = concat(local.prefix, ["rg"])
  location = "West Europe"
}

/* 
resource "azurerm_virtual_network" "public-ip-nsg-protected-vm-vnet" {
  name                = concat(local.environment) "public-ip-nsg-protected-vm-vnet"
  resource_group_name = azurerm_resource_group.public-ip-nsg-protected-vm-rg.name
  location            = azurerm_resource_group.public-ip-nsg-protected-vm-rg.location
  address_space       = ["10.1.128.0/24"]
}

resource "azurerm_subnet" "vm-subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.public-ip-nsg-protected-vm-rg.name
  virtual_network_name = azurerm_virtual_network.public-ip-nsg-protected-vm-vnet.name
  address_prefixes     = ["10.1.128.0/28"]
}

resource "azurerm_network_security_group" "public-ip-nsg-protected-vm-rg-nsg" {
  name                = "example-nsg"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = local.allowed_ip_addresses
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.example.id
  network_security_group_id = azurerm_network_security_group.example.id
}

resource "azurerm_public_ip" "example" {
  name                = "example-public-ip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "example-ip-config"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_B1s"

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name  = "example-host"
  admin_username = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  disable_password_authentication = true
}
 */