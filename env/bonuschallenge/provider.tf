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
  #   key                  = "3terraform.tfstate"

  # }

  required_version = "1.10.5"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}