resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}-nsg"
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_route_table" "rt" {
  name                = "${var.name}-rt"
  resource_group_name = var.resource_group_name
  location            = var.location

  route = [] #! need config here to make this production ready
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
}

resource "azurerm_subnet" "sn" {
  for_each = var.subnets

  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  name             = each.value.name
  address_prefixes = [each.value.address_prefix]
}

resource "azurerm_subnet_network_security_group_association" "sn_nsg_assoc" {
  for_each = var.subnets

  subnet_id                 = azurerm_subnet.sn[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_route_table_association" "sn_rt_assoc" {
  for_each = var.subnets

  subnet_id      = azurerm_subnet.sn[each.key].id
  route_table_id = azurerm_route_table.rt.id
}

