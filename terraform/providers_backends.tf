terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.95.0"
    }
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.2.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azuredevops" {
  use_msi = true
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "formulamonks"
    container_name       = "formulamonksstate"
    key                  = "statefiles/state.tfstate"
  }
}




