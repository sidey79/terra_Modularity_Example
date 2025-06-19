variable "name" {
  type        = string
  description = "Name der Identity (z. B. nach Schema)"
}

variable "location" {
  type        = string
  description = "Azure-Region"
}

variable "resource_group_name" {
  type        = string
  description = "Ressourcengruppe"
}

variable "role_assignments" {
  type = list(object({
    role_definition_name = string
    scope                = string
  }))
  default     = []
  description = "Optionale Rollenzuweisungen für die Identity"
}
