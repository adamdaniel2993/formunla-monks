resource "azurerm_container_registry" "formula_registry" {
  name                = "formularegistry${terraform.workspace}"
  resource_group_name = azurerm_resource_group.formula_monks_rsg.name
  location            = azurerm_resource_group.formula_monks_rsg.location
  sku                 = "Standard"
  admin_enabled       = false
}