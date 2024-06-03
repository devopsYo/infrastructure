module "KeyVaultSecret" {
  source                              = "../../modules/azure-key-vault-secret"
  count                               = length(var.kv_secret_list_config)
  kv_secret_config                    = var.kv_secret_list_config[count.index]
  kv_id                               = var.kv_id
}
