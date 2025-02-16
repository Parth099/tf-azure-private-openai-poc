resource "azurerm_role_assignment" "self_kv_key_creator" {
  scope                = module.rg.id
  role_definition_name = "Key Vault Crypto Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}
