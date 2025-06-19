variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "minimum_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "allow_blob_public_access" {
  type    = bool
  default = false
}

variable "cmk_key_id" {
  type = string
}

variable "storage_queues" {
  type = map(object({
    name     = string
    metadata = optional(map(string), {})
  }))
  default = {}
}

variable "storage_tables" {
  type = map(object({
    name = string
  }))
  default = {}
}

variable "lifecycle_rules" {
  type    = list(any)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "blob_delete_retention_days" {
  type    = number
  default = 7
}
