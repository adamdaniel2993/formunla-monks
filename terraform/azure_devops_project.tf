#resource "azuredevops_project" "formula_monks_azdvps" {
#  name               = "formula_monks_web"
#  visibility         = "public"
#  version_control    = "Git"
#  work_item_template = "Basic"
#  description        = "Managed by Terraform"
#    features = {
#    "boards"       = "enabled"
#    "repositories" = "enabled"
#    "pipelines"    = "enabled"
#    "testplans"    = "disabled"
#    "artifacts"    = "disabled"
#  }
#}
#
#
#resource "azuredevops_build_definition" "pipeline" {
#  project_id = azuredevops_project.formula_monks_azdvps.id
#  name       = "ExamplePipeline"
#  path       = "\\"
#
#  repository {
#    repo_type   = "GitHub"
#    repo_id     = "adamdaniel2993/formunla-monks"
#    branch_name = "main"
#    yml_path    = "azure-pipelines.yml"
#  }
#}
