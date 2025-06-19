resource "azurerm_key_vault" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = var.tenant_id
  sku_name                      = "standard"
  soft_delete_enabled           = true
  purge_protection_enabled      = true
  public_network_access_enabled = var.public_network_access_enabled

  network_acls {
    default_action = "Deny"
    bypass         = ["AzureServices"]
    ip_rules       = var.allowed_ips
  }

  tags = var.tags
}

resource "azurerm_key_vault_key" "cmk" {
  name         = var.key_name
  key_vault_id = azurerm_key_vault.this.id
  key_type     = "RSA"
  key_size     = 2048
}

resource "azurerm_key_vault_access_policy" "this" {
  for_each                = { for idx, val in var.access_policies : idx => val }
  key_vault_id            = azurerm_key_vault.this.id
  tenant_id               = var.tenant_id
  object_id               = each.value.object_id
  key_permissions         = lookup(each.value.permissions, "keys", [])
  secret_permissions      = lookup(each.value.permissions, "secrets", [])
  certificate_permissions = lookup(each.value.permissions, "certificates", [])
}
