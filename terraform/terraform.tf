# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.65.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-devel-nito"
    storage_account_name = "tfstatenito"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_version = ">= 1.14.7"
}

provider "azurerm" {
  features {}
}
