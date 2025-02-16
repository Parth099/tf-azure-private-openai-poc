output "id" {
  description = "The ID of the Azure Key Vault"
  value       = azurerm_key_vault.kv.id
}

output "name" {
  description = "The name of the Azure Key Vault"
  value       = azurerm_key_vault.kv.name
}

output "uri" {
  description = "The URI of the Azure Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}

output "keys" {
  description = "Key Details"
  value = {
    for key_name, key in azurerm_key_vault_key.keys :
    key_name => {
      name                    = key_name
      id                      = key.id
      resource_id             = key.resource_id
      resource_versionless_id = key.resource_versionless_id
      version                 = key.version
      versionless_id          = key.versionless_id
    }
  }
}
