module "keyvault" {
  source                        = "../../../modules/keyvault"
  name                          = "${var.workload_name}-kv"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = var.tenant_id
  key_name                      = "cmk-${var.workload_name}"
  access_policies               = var.access_policies
  allowed_ips                   = var.allowed_ips
  public_network_access_enabled = false
}

module "identity" {
  source              = "../../../modules/identity"
  name                = "${var.workload_name}-mi"
  location            = var.location
  resource_group_name = var.resource_group_name
  role_assignments    = var.identity_role_assignments
}

module "storage" {
  source                   = "../../../modules/storage"
  name                     = "st${var.workload_name}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  cmk_key_id               = module.keyvault.key_id
  storage_queues           = var.storage_queues
  storage_tables           = var.storage_tables
  allow_blob_public_access = false
  minimum_tls_version      = "TLS1_2"
}

module "logicapp" {
  source                    = "../../../modules/logicapp"
  name                      = "la-${var.workload_name}"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  user_assigned_identity_id = module.identity.id
  workflow_definition       = var.workflow_definition
  workflow_parameters       = var.workflow_parameters
}
