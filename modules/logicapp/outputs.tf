output "logic_app_id" {
  value       = azurerm_logic_app_workflow.this.id
  description = "ID der Logic App"
}

output "logic_app_name" {
  value       = azurerm_logic_app_workflow.this.name
  description = "Name der Logic App"
}

output "outbound_service_tag" {
  value       = "LogicApps.${var.location}"
  description = "Service Tag für NSG, Key Vault oder Firewall IP Rules"
}
