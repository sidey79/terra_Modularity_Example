variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
}

variable "allowed_ips" {
  type    = list(string)
  default = []
}

variable "access_policies" {
  type = list(object({
    object_id = string
    permissions = object({
      keys         = list(string)
      secrets      = list(string)
      certificates = list(string)
    })
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
