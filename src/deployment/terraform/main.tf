terraform {
  backend "local" {
    path = "terraform"
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

resource "azurerm_resource_group" "example" {
  name     = "github-rg01-0001"
  location = "West Europe"
}
