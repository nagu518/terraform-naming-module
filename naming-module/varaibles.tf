variable "base_name" {
  description = "The base name for the resource."
  type        = string
}

variable "resource_type" {
  description = "The type of the resource."
  type        = string
  validation {
    condition     = contains(["virtual_machine", "key_vault", "storage_account"], var.resource_type)
    error_message = "resource_type must be one of 'virtual_machine', 'key_vault', or 'storage_account'."
  }
}

