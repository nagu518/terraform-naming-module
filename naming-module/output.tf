output "resource_name" {
  description = "The generated resource name"
  value       = coalesce(
    try(null_resource.resource_name[0].triggers.resource_name, null),
    try(null_resource.key_vault_name[0].triggers.resource_name, null),
    try(null_resource.storage_account_name[0].triggers.resource_name, null)
  )
}

