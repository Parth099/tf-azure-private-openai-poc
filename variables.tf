variable "app_name" {
  description = "Name of the Application"
  default     = "poai-poc"
}

variable "location" {
  description = "Default Location of Resources"
  default     = "eastus"
}

variable "networking_config" {
  description = "Networking Configuration"
  type = object({
    address_space = string
    subnet = map(object({
      name           = string
      address_prefix = string
    }))
  })

  default = {
    address_space = "10.0.0.0/24"
    subnet = {
      pe = {
        name           = "private-endpoint"
        address_prefix = "10.0.0.0/27"
      }
      wl = {
        name           = "workload"
        address_prefix = "10.0.0.32/27"
      }
    }
  }
}
