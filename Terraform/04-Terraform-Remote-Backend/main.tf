terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.30.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id                 = "91606a03-e14d-44a9-94a1-fa2cc0f8244b"
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "demo" {
  name     = "tf-backend-demo-rg"
  location = "East US"
}