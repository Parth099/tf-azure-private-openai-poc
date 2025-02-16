output "name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the virtual network"
}

output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the virtual network"
}

output "address_space" {
  value       = azurerm_virtual_network.vnet.address_space
  description = "The address space of the virtual network"
}

output "resource_group" {
  value       = azurerm_virtual_network.vnet.resource_group_name
  description = "The resource group name of the virtual network"
}

output "location" {
  value       = azurerm_virtual_network.vnet.location
  description = "The location of the virtual network"
}

output "subnets" {
  value = {
    for subnet_key, subnet_value in azurerm_subnet.sn :
    subnet_key => {
      name           = subnet_value.name
      address_prefix = subnet_value.address_prefixes[0]
      id             = subnet_value.id
    }
  }
}
