resource "azurerm_storage_account" "StorageAccount" {
  name                          = var.storage_account_config.name
  resource_group_name           = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                      = var.rg_config.location
  account_tier                  = var.storage_account_config.account_tier
  account_replication_type      = var.storage_account_config.account_replication_type
  public_network_access_enabled = var.storage_account_config.public_network_access_enabled     

  network_rules {
    default_action                 = var.storage_account_config.network_rules_default_action  
  }
}


module "PrivateDnsZone" {
  source                                        = "../../modules/azure-private-dns-zone"
  count                                         = var.storage_account_config.private_dns_enable
  private_dns_zone_name                         = "${var.storage_account_config.name}${var.storage_account_config.private_dns_zone_suffix}"
  rg_config                                     = var.rg_config
}



