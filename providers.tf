terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.19.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "43639bd3-e6e6-41c7-bbf1-ebb8bd52a4bf"
}
