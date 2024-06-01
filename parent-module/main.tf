module "naming_modules" {
  source = "../naming-module"

  for_each = var.resources_map

  base_name     = each.key
  resource_type = each.value
}

output "resource_names" {
  value = { for k, v in module.naming_modules : k => v.resource_name }
}


