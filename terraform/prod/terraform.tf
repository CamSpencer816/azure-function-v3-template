# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "prefx-terraform-prod-rg"
    storage_account_name = "prefxterraformprodsa"
    container_name       = "my-function"
    key                  = "tfstate.prod"
  }
}
