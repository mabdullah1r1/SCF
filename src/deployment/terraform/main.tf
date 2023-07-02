provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my001-resource100-group001"
  location = "West Europe"
}
