# terraform-naming-modules
This repository contains two Terraform modules for naming resources within a cloud environment.

     ## Naming Module

     The `naming-module` generates resource names based on a given base name and resource type. The supported resource types are `virtual_machine`, `key_vault`, and `storage_account`.

     ### Usage

     module "naming_example" {
       source = "github.com/username/terraform-naming-modules//naming-module"

       base_name     = "example"
       resource_type = "virtual_machine"
     }

     output "resource_name" {
       value = module.naming_example.resource_name
     }
     

     ## Parent Module

     The `parent-module` iterates over a map of base names and resource types, generating resource names for each entry using the `naming-module`.

     ### Usage

     
     module "resource_naming" {
       source = "github.com/username/terraform-naming-modules//parent-module"

       resources_map = {
         "examplevmname"   = "virtual_machine",
         "examplekvname"   = "key_vault",
         "example-sa-name" = "storage_account"
       }
     }

     output "resource_names" {
       value = module.resource_naming.resource_names
     }
     
