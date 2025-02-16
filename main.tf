locals {
  used_services = toset([
    "Virtual Network",
    "Resource Group",
    "Private Endpoint",
    "Network Security Group",
    "Subnet",
    "Key Vault"
  ])
}

module "naming" {
  source           = "./modules/naming"
  for_each         = local.used_services
  svc_name         = each.value
  application_name = var.app_name
  region           = var.location
  environment      = "dev"
}

module "rg" {
  source = "./modules/azurerm_resourcegroup"
  name   = module.naming["Resource Group"].name
}

module "kv" {
  source              = "./modules/azurerm_key_vault"
  name                = module.naming["Key Vault"].name
  location            = var.location
  resource_group_name = module.rg.name
  is_private          = true
  keys = [
  ]

  depends_on = [azurerm_role_assignment.self_kv_key_creator]
}
