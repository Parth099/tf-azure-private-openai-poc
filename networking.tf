locals {

}

module "networking" {
  source              = "./modules/azurerm_virtual_network"
  name                = module.naming["Virtual Network"].name
  resource_group_name = module.rg.name
  location            = var.location

  address_space = var.networking_config.address_space

  subnets = {
    for subnet_key, subnet_value in var.networking_config.subnet :
    subnet_key => {
      name           = "${module.naming["Subnet"].prefix}-${subnet_value.name}-${module.naming["Subnet"].suffix}"
      address_prefix = subnet_value.address_prefix
    }
  }
}


