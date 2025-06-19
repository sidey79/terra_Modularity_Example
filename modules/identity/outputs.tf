output "client_id" {
  value       = azurerm_user_assigned_identity.this.client_id
  description = "Client-ID der Identity"
}

output "principal_id" {
  value       = azurerm_user_assigned_identity.this.principal_id
  description = "Object-ID (principal) der Identity"
}

output "id" {
  value       = azurerm_user_assigned_identity.this.id
  description = "Ressourcen-ID"
}
