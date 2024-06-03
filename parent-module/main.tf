module "naming_module" {
  source = "../naming_module" // Adjust this if you place it in a different directory or use a GitHub URL
  
  for_each = var.resources

  base_name     = each.key
  resource_type = each.value
}

output "resource_names" {
  description = "A map of base names to generated resource names"
  value       = { for k, v in var.resources : k => module.naming_module[k].resource_name }
}


