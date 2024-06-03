module "StorageAccount" {
  source                              = "../../modules/azure-storage-account"
  count                               = length(var.storage_account_list_config)
  storage_account_config              = var.storage_account_list_config[count.index]
  storage_account_config_dependency   = var.storage_account_config_dependency
  rg_config                           = var.rg_config
}
