output "acr_login_server" {
  value = module.azure_registry.acr_login_server
}

output "acr_admin_username" {
  value = module.azure_registry.acr_admin_username
}

output "acr_admin_password" {
  value = module.azure_registry.acr_admin_password
  sensitive = true
}

output "function_app_url" {
  value = module.azure_function.function_app_url
}
