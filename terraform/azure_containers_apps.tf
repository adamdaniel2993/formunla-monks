locals {
  stack = "${var.app}-${terraform.workspace}-${var.location}"

  default_tags = {
    environment = terraform.workspace
    owner       = "AD"
    app         = var.app
  }

}

resource "azurerm_log_analytics_workspace" "formula_monks_web_law" {
  name                = "log-${local.stack}"
  location            = azurerm_resource_group.formula_monks_rsg.location
  resource_group_name = azurerm_resource_group.formula_monks_rsg.name
  tags                = local.default_tags
}

resource "azurerm_container_app_environment" "formula_monks_contapp_env" {
  name                = "${local.stack}-contapp"
  location            = azurerm_resource_group.formula_monks_rsg.location
  resource_group_name = azurerm_resource_group.formula_monks_rsg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.formula_monks_web_law.id

  tags = local.default_tags
}

resource "azurerm_user_assigned_identity" "containerapp" {
  location            = azurerm_resource_group.formula_monks_rsg.location
  name                = "containerappmi"
  resource_group_name = azurerm_resource_group.formula_monks_rsg.name
}

resource "azurerm_role_assignment" "containerapp" {
  scope                = azurerm_container_registry.formula_registry.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.containerapp.principal_id
  depends_on = [
    azurerm_user_assigned_identity.containerapp
  ]
}

resource "azurerm_role_assignment" "containerapp_scope2" {
  scope                = azurerm_resource_group.formula_monks_rsg.id
  role_definition_name = "acrpull"
  principal_id         = azurerm_user_assigned_identity.containerapp.principal_id
  depends_on = [
    azurerm_user_assigned_identity.containerapp
  ]
}

resource "time_sleep" "wait_20_seconds" {
  create_duration = "20s"
}

resource "azurerm_container_app" "formula_monks_contapp" {
  name                         = local.stack
  container_app_environment_id = azurerm_container_app_environment.formula_monks_contapp_env.id
  resource_group_name          = azurerm_resource_group.formula_monks_rsg.name
  revision_mode                = "Single"

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.containerapp.id]
  }

  registry {
    server   = azurerm_container_registry.formula_registry.login_server
    identity = azurerm_user_assigned_identity.containerapp.id
  }

  ingress {
    allow_insecure_connections = false
    external_enabled           = true
    target_port                = 8000
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }

  }

  template {
    container {
      name   = "${var.app}-web-${terraform.workspace}"
      image  = "${azurerm_container_registry.formula_registry.login_server}/formulamonksweb${terraform.workspace}:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }

  }

  tags = local.default_tags

  depends_on = [
    azurerm_container_registry.formula_registry,
    azurerm_user_assigned_identity.containerapp,
    time_sleep.wait_20_seconds ]
}