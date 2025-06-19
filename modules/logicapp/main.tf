resource "azurerm_logic_app_workflow" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  identity {
    type         = var.user_assigned_identity_id != null ? "UserAssigned" : "None"
    identity_ids = var.user_assigned_identity_id != null ? [var.user_assigned_identity_id] : null
  }

  definition = var.workflow_definition
  parameters = var.workflow_parameters

  tags = var.tags
}
