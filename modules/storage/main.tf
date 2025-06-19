resource "azurerm_storage_account" "this" {
  name                     = var.name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = var.minimum_tls_version
  allow_blob_public_access = var.allow_blob_public_access
  enable_https_traffic_only = true

  identity {
    type = "SystemAssigned"
  }

  blob_properties {
    delete_retention_policy {
      days = var.blob_delete_retention_days
    }
  }

  encryption {
    services {
      blob {
        enabled           = true
      }
    }
    key_source = "Microsoft.Keyvault"
    key_vault_key_id = var.cmk_key_id
  }

  tags = var.tags
}

resource "azurerm_storage_queue" "queues" {
  for_each             = var.storage_queues
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
  resource_group_name  = var.resource_group_name
  metadata             = each.value.metadata
}

resource "azurerm_storage_table" "tables" {
  for_each             = var.storage_tables
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_storage_management_policy" "lifecycle" {
  count = length(var.lifecycle_rules) > 0 ? 1 : 0
  storage_account_id = azurerm_storage_account.this.id

  rule = var.lifecycle_rules
}
