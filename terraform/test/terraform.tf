# Configure the Microsoft Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "prefx-terraform-test-rg"
    storage_account_name = "prefxterraformtestsa"
    container_name       = "terraform-state"
    key                  = "my-function.test"
  }
}
