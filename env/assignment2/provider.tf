terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.37.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "mkrg"
  #   storage_account_name = "mkstgbackup"
  #   container_name       = "container"
  #   key                  = "1terraform.tfstate"

  # }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id

}