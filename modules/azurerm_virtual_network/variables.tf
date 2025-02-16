variable "name" {
  description = "The name of the virtual network"
  type        = string
}

variable "location" {
  description = "The location/region where the virtual network is created"
  type        = string
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network"
  type        = string
}

variable "subnets" {
  description = "The subnet configuration for the virtual network"
  type = map(object({
    name           = string
    address_prefix = string
  }))
}

variable "security_rules" {
  description = "The security rules for the network security group"
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

  default = {
    "HTTP" = {
      name                       = "Allow-HTTP-ALL"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
    "HTTPS" = {
      name                       = "Allow-HTTPS-ALL"
      priority                   = 401
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
