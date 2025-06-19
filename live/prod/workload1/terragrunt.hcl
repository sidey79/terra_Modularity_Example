terraform {
  source = "./"
}

dependency "defaults" {
  config_path = "../defaults"
}

inputs = {
  workload_name        = "orders"
  location             = "westeurope"
  resource_group_name  = "rg-prod"
  tenant_id            = "00000000-0000-0000-0000-000000000000"
  allowed_ips          = ["LogicApps.westeurope"]

  access_policies = [
    {
      object_id = "00000000-0000-0000-0000-111111111111"
      permissions = {
        keys         = ["get", "encrypt"]
        secrets      = ["get"]
        certificates = []
      }
    }
  ]

  identity_role_assignments = [
    {
      role_definition_name = "Storage Blob Data Reader"
      scope                = "replace-me"
    }
  ]

  storage_queues = {
    q1 = { name = "input" }
  }

  storage_tables = {
    t1 = { name = "audit" }
  }

  workflow_definition = file("${path.module}/workflow-definition.json")
  workflow_parameters = {}
}
