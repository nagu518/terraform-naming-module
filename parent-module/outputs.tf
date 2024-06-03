output "resource_names" {
  description = "A map of base names to generated resource names"
  value       = { for k, v in var.resources : k => module.naming_module[k].resource_name }
}

