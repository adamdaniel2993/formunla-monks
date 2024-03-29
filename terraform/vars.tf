variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "eastus"
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
  default     = "formulamonks"
}

variable "location" {
  description = "Location short name "
  type        = string
  default     = "use"
}