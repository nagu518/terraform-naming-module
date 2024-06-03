# Terraform Naming Module

This repository contains Terraform modules for generating resource names based on a given `base_name` and `resource_type`.

## Structure

terraform-naming-module/
├── example_usage/
│ └── main.tf
├── naming_module/
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
└── parent_module/
├── main.tf
├── outputs.tf
└── variables.tf


## Modules

### Naming Module

The `naming_module` generates resource names based on the provided `base_name` and `resource_type`.

**Variables:**
- `base_name` (string): The base name for the resource.
- `resource_type` (string): The type of the resource. Must be one of `virtual_machine`, `key_vault`, or `storage_account`.

**Outputs:**
- `resource_name` (string): The generated resource name.

### Parent Module

The `parent_module` takes a map of resources and generates names for each using the `naming_module`.

**Variables:**
- `resources` (map(string)): A map of base names to resource types.

**Outputs:**
- `resource_names` (map(string)): A map of base names to generated resource names.

## Usage

### Example Usage

Navigate to the `example_usage` directory and run the following commands:

1. **Initialize Terraform**:
    
    terraform init
    

2. **Review the Execution Plan**:
    
    terraform plan
    

3. **Apply the Plan**:
    
    terraform apply
    

4. **Verify the Outputs**:
    
    terraform output
    

### Cleaning Up

To destroy the resources created by Terraform, run:


terraform destroy
    
