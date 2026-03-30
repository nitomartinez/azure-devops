variable "docker_image_tag" {
  type = string
  default = "latest"
}
variable "resource_group_name" {
  type = string
  default = "rg-devel-nito"
}

variable "location" {
  type = string
  default = "spaincentral"
}

variable "registry_name" {
  type = string
  default = "registrynito"
}

variable "storage_account_name" {
  type = string
  default = "storageaccountnito"
}

variable "function_app_name" {
  type = string
  default = "pingservice"
}

variable "docker_image_name" {
  type = string
  default = "qindel/azure-course"
}

variable "websites_port" {
  type    = string
  default = "8080"
}

variable "common_tags" {
  type = map(string)
  default = {
    owner = "353827+nitomartinez@users.noreply.github.com"
  }
}
