variable "docker_image_tag" {
  type = string
}
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}


variable "function_app_name" {
  type = string
}

variable "docker_image_name" {
  type = string
}

variable "docker_registry_url" {
  type = string
}

variable "docker_registry_username" {
  type = string
}

variable "docker_registry_password" {
  type = string
}

variable "websites_port" {
  type    = string
  default = "8080"
}
