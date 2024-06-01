output "resource_names" {
  description = "The generated resource names."
  value       = { for k, v in module.naming_modules : k => v.resource_name }
}

