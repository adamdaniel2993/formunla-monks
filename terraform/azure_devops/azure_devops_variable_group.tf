#resource "azuredevops_variable_group" "azure_credentials" {
#  project_id   = azuredevops_project.example.id
#  name         = "Example Pipeline Variables"
#  description  = "Managed by Terraform"
#  allow_access = true
#
#  variable {
#    name  = "FOO"
#    value = "BAR"
#  }
#}