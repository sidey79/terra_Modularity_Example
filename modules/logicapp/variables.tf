variable "name" {
  type        = string
  description = "Name der Logic App"
}

variable "location" {
  type        = string
  description = "Azure-Region"
}

variable "resource_group_name" {
  type        = string
  description = "Ressourcengruppe"
}

variable "workflow_definition" {
  type        = any
  default     = {}
  description = "Workflow-Definition als JSON (optional)"
}

variable "workflow_parameters" {
  type        = map(any)
  default     = {}
  description = "Workflow-Parameter-Überschreibung (optional)"
}

variable "user_assigned_identity_id" {
  type        = string
  default     = null
  description = "Optional: ID einer User Assigned Identity"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional: Tags"
}
