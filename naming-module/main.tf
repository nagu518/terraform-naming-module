locals {
  truncated_base_name = substr(var.base_name, 0, 15 - 7)  # 15 minus length of "vm-" and "-00"
}

resource "null_resource" "resource_name" {
  count = var.resource_type == "virtual_machine" ? 1 : 0

  triggers = {
    resource_name = format("vm-%s-00", local.truncated_base_name)
  }
}

resource "null_resource" "key_vault_name" {
  count = var.resource_type == "key_vault" ? 1 : 0

  triggers = {
    resource_name = format("kv-%s", lower(var.base_name))
  }
}

resource "null_resource" "storage_account_name" {
  count = var.resource_type == "storage_account" ? 1 : 0

  triggers = {
    resource_name = format("sa%s", replace(lower(var.base_name), "-", ""))
  }
}

output "resource_name" {
  value = coalesce(
    try(null_resource.resource_name[0].triggers.resource_name, null),
    try(null_resource.key_vault_name[0].triggers.resource_name, null),
    try(null_resource.storage_account_name[0].triggers.resource_name, null)
  )
}

