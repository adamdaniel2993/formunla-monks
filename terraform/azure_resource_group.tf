resource "azurerm_resource_group" "formula_monks_rsg" {
    location = "eastus"
    name     = "formulamonks"
    tags     = {
        "app" = "formulamonks"
    }
}
