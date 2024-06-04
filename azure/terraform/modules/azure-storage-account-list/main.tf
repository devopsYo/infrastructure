module "StorageAccount" {
  source                              = "../../modules/azure-storage-account"
  count                               = length(var.storage_account_list_config)
  storage_account_config              = var.storage_account_list_config[count.index]
  rg_config                           = var.rg_config
}
