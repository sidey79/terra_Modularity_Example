resource "azurerm_user_assigned_identity" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_role_assignment" "assignments" {
  for_each             = { for idx, val in var.role_assignments : idx => val }
  principal_id         = azurerm_user_assigned_identity.this.principal_id
  role_definition_name = each.value.role_definition_name
  scope                = each.value.scope
}
