output "key_id" {
  value       = azurerm_key_vault_key.cmk.id
  description = "ID des CMK-Schlüssels"
}

output "vault_uri" {
  value       = azurerm_key_vault.this.vault_uri
  description = "DNS URI des Vaults"
}
