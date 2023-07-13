terraform {
  backend "azurerm" {
   
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_pet" "rg_name" {
  length    = 2
  separator = "-"
}

resource "azurerm_resource_group" "example" {
  name     = "above-mayfly"
  location = "eastus2"
}

output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
