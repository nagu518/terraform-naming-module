module "parent_module" {
  source = "../parent_module"  // Adjust the path accordingly

  resources = {
    "myResource1"     = "virtual_machine",
    "my-keyvault"     = "key_vault",
    "storage-example" = "storage_account"
  }
}

output "generated_resource_names" {
  value = module.parent_module.resource_names
}

