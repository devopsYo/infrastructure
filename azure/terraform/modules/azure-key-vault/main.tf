data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "KeyVault" {
  name                        = var.kv_config.name
  location                    = var.rg_config.location
  resource_group_name         = "${var.rg_config.prefix}-${var.rg_config.name}"
  enabled_for_disk_encryption = var.kv_config.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = var.kv_config.soft_delete_retention_days
  purge_protection_enabled    = var.kv_config.purge_protection_enabled
  sku_name                    = var.kv_config.sku_name

  access_policy {
    tenant_id                 = data.azurerm_client_config.current.tenant_id
    object_id                 = data.azurerm_client_config.current.object_id
    key_permissions           = var.kv_config.key_permissions
    secret_permissions        = var.kv_config.secret_permissions
    storage_permissions       = var.kv_config.storage_permissions
  }
}

/*
module "PrivateEndpoint" {
  source                                        = "../../modules/azure-private-endpoint"
  count                                         = var.kv_config.private_endpoint_enable
  private_endpoint_config                       = var.kv_config.private_endpoint_config
  private_endpoint_config_dependency = {
    subnet_id                                   = var.kv_config_dependency.subnet_id
    private_service_connection_name             = azurerm_key_vault.KeyVault.name
    private_service_connection_resource_id      = azurerm_key_vault.KeyVault.id
    private_dns_zone_id                         = module.PrivateDnsZone.Current.id
  }
  rg_config                                     = var.rg_config
}

module "PrivateDnsZone" {
  source                                        = "../../modules/azure-private-dns-zone"
  private_dns_zone_name                         = "${var.kv_config.name}${var.kv_config.private_dns_zone_suffix}"
  rg_config                                     = var.rg_config
}

module "PrivateDnsZoneVirtualNetworkLink" {
  source                                           = "../../modules/azure-private-dns-zone-virtual-network-link"
  private_dns_zone_virtual_network_link_name       = "${var.kv_config.name}-${var.kv_config.private_dns_zone_virtual_network_link_name}"
  private_dns_zone_virtual_network_link_dependency = {
    private_dns_zone_name                               = module.PrivateDnsZone.Current.name
    virtual_network_id                                  = var.kv_config_dependency.virtual_network_id
  }
  rg_config                                        = var.rg_config
}
*/