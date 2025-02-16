data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 45
  purge_protection_enabled    = true

  sku_name                      = "standard"
  public_network_access_enabled = var.is_private ? false : true

  enable_rbac_authorization = true

  network_acls {
    bypass         = "AzureServices"
    default_action = var.is_private ? "Deny" : "Allow"
  }
}

resource "azurerm_key_vault_key" "keys" {
  for_each     = toset(var.keys)
  name         = each.value
  key_vault_id = azurerm_key_vault.kv.id
  key_type     = "RSA"
  key_size     = 3048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}


