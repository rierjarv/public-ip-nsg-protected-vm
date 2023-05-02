terraform {
  backend "azurerm" {
    resource_group_name  = "terraformbackends"
    storage_account_name = "rjterraformbackends"
    container_name       = "public-ip-nsg-protected-vm"
    key                  = "dev.terraform.tfstate"
  }
}