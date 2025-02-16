locals {
  used_services = toset([
    "Virtual Network",
    "Resource Group",
    "Private Endpoint",
    "Network Security Group",
    "Subnet",
  ])
}

module "naming" {
  source           = "./modules/naming"
  for_each         = local.used_services
  svc_name         = each.value
  application_name = var.app_name
  region           = var.location
  environment      = "prod"
}

module "rg" {
  source = "./modules/azurerm_resourcegroup"
  name   = module.naming["Resource Group"].name
}


