output "resource_name" {
  description = "The generated resource name."
  value       = chomp(file("${path.module}/generated_name.txt"))
}

