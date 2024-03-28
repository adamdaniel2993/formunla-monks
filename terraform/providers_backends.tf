terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name   = "formulamonks"
    storage_account_name  = "formulamonkstest"
    container_name        = "formulamonksstate"
    key                   = "statefiles/state.tfstate"
  }
}
