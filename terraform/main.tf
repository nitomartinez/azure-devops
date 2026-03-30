
module "azure_registry" {
  source              = "./modules/azure_registry"
  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = var.registry_name
}

module "azure_function" {
  source = "./modules/azure_function"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  function_app_name          = var.function_app_name
  docker_image_name          = var.docker_image_name
  docker_image_tag           = var.docker_image_tag
  docker_registry_url        = module.azure_registry.acr_login_server
  docker_registry_username   = module.azure_registry.acr_admin_username
  docker_registry_password   = module.azure_registry.acr_admin_password
  websites_port              = var.websites_port
}

