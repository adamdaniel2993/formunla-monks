output "azurerm_container_app_url" {
  value = azurerm_container_app.formula_monks_contapp.latest_revision_fqdn
}