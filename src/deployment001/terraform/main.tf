terraform {
  backend "azurerm" {

  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.62.1"
    }
  }
}

# sub-general-nprd-01
provider "azurerm" {
  features {}
  subscription_id = "d55b5b44-99f7-476c-bcd2-7d0163f0d778"
}

# sub-management-01
# metrics
provider "azurerm" {
  features {}
  alias           = "remote"
  subscription_id = "c2dba585-3f67-495a-b2d6-c827eeaf4757"
}

# sub-identity-01
# private DNS zones
provider "azurerm" {
  features {}
  alias           = "remote2"
  subscription_id = "fc57ea3c-e463-4650-9652-4f005dc7f2df"
}

# sub-security-01
# logs 
provider "azurerm" {
  features {}
  alias           = "remote4"
  subscription_id = "0b5a7972-9824-46cc-b6cf-047662dd35df"
}

variable "inputs" {}
module "infra" {
  source = "https://github.com/r1-development/scf-general-nprd.git"
  inputs = var.inputs
  providers = {
    azurerm.remote4 = azurerm.remote4
    azurerm.remote  = azurerm.remote
    azurerm.remote2 = azurerm.remote2
    azurerm.remote3 = azurerm

  }
}
output "infra" {
  value = module.infra
}