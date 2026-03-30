resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "function" {
  name                = "${var.resource_group_name}-dynamic-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "EP1"
}

resource "azurerm_linux_function_app" "function" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  service_plan_id            = azurerm_service_plan.function.id
  storage_account_name       = azurerm_storage_account.main.name
  storage_account_access_key = azurerm_storage_account.main.primary_access_key
  site_config {

    application_stack {
      docker {
        registry_url      = var.docker_registry_url
        image_name        = var.docker_image_name
        image_tag         = var.docker_image_tag
        registry_username = var.docker_registry_username
        registry_password = var.docker_registry_password
      }
    }
  }
  app_settings = {
    "WEBSITES_PORT" = var.websites_port
  }
}

output "function_app_url" {
  value = azurerm_linux_function_app.function.default_hostname
}
