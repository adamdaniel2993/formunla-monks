resource "azurerm_resource_group" "formula_monks_rsg" {
  location = var.region
  name     = var.app
  tags = {
    "app" = var.app
  }
}
