provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my01-resource01-group01"
  location = "West Europe"
}
