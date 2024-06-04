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

#module "PrivateEndpoint" {
#  source                                        = "../../modules/azure-private-endpoint"
#  count                                         = var.storage_account_config.private_endpoint_enable
#  private_endpoint_config                       = var.storage_account_config.private_endpoint_config
#  private_endpoint_config_dependency = {
#    subnet_id                                   = var.storage_account_config_dependency.subnet_id
#    private_service_connection_name             = azurerm_storage_account.StorageAccount.name
#    private_service_connection_resource_id      = azurerm_storage_account.StorageAccount.id
#    private_dns_zone_id                         = module.PrivateDnsZone.Current.id
#  }
#  rg_config                                     = var.rg_config
#}

module "PrivateDnsZone" {
  source                                        = "../../modules/azure-private-dns-zone"
  count                                         = var.storage_account_config.private_dns_enable
  private_dns_zone_name                         = "${var.storage_account_config.name}${var.storage_account_config.private_dns_zone_suffix}"
  rg_config                                     = var.rg_config
}

#module "PrivateDnsZoneVirtualNetworkLink" {
#  source                                           = "../../modules/azure-private-dns-zone-virtual-network-link"
#  count                                            = var.storage_account_config.private_dns_enable
#  private_dns_zone_virtual_network_link_name       = "${var.storage_account_config.name}-${var.storage_account_config.private_dns_zone_virtual_network_link_name}"
#  private_dns_zone_virtual_network_link_dependency = {
#    private_dns_zone_name                               = module.PrivateDnsZone.Current.name
#    virtual_network_id                                  = var.storage_account_config_dependency.virtual_network_id
#  }
#  rg_config                                        = var.rg_config
#}


