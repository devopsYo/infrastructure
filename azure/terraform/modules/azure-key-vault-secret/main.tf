resource "azurerm_key_vault_secret" "KeyVaultSecret" {
  name         = var.key_vault_secret_config.name
  value        = var.key_vault_secret_config.isFileType ? filebase64(var.key_vault_secret_config.value) : var.key_vault_secret_config.value
  tags         = var.key_vault_secret_config.tags
  key_vault_id = var.key_vault_secret_config_dependency.value.id
}