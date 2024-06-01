resource "null_resource" "generate_name" {
  count = 1

  provisioner "local-exec" {
    command = <<EOT
      base_name="${var.base_name}"
      resource_type="${var.resource_type}"

      case "$resource_type" in
        "virtual_machine")
          prefix="vm-"
          suffix="-00"
          max_length=15
          total_length=$((${#prefix} + ${#suffix}))
          available_length=$((max_length - total_length))
          if [ ${#base_name} -gt $available_length ]; then
            base_name=${base_name:0:$available_length}
          fi
          resource_name="${prefix}${base_name}${suffix}"
          ;;
        "key_vault")
          resource_name="kv-${base_name,,}"
          ;;
        "storage_account")
          resource_name="sa${base_name//-/}"
          resource_name="${resource_name,,}"
          ;;
      esac

      echo $resource_name > generated_name.txt
    EOT
  }
}

output "resource_name" {
  value = chomp(file("${path.module}/generated_name.txt"))
}

