module "PrivateDnsZone" {
  source                                        = "../../modules/azure-private-dns-zone"
  private_dns_zone_name                         = "${var.mysql_config.name}${var.mysql_config.private_dns_zone_suffix}"
  rg_config                                     = var.rg_config
}

module "PrivateDnsZoneVirtualNetworkLink" {
  source                                           = "../../modules/azure-private-dns-zone-virtual-network-link"
  private_dns_zone_virtual_network_link_name       = "${var.mysql_config.name}-${var.mysql_config.private_dns_zone_virtual_network_link_name}"
  private_dns_zone_virtual_network_link_dependency = {
    private_dns_zone_name                               = module.PrivateDnsZone.Current.name
    virtual_network_id                                  = var.mysql_config_dependency.virtual_network_id
  }
  rg_config                                        = var.rg_config
}

resource "azurerm_mysql_flexible_server" "MySqlServer" {
  name                         = var.mysql_config.name
  resource_group_name          = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                     = var.rg_config.location
  administrator_login          = var.mysql_config.administrator_login
  administrator_password       = var.mysql_config.administrator_password
  backup_retention_days        = var.mysql_config.backup_retention_days
  geo_redundant_backup_enabled = var.mysql_config.geo_redundant_backup_enabled
  delegated_subnet_id          = var.mysql_config_dependency.subnet_id
  private_dns_zone_id          = module.PrivateDnsZone.Current.id
  sku_name                     = var.mysql_config.sku_name
  version                      = var.mysql_config.version
  zone                         = var.mysql_config.zone
  high_availability {
    mode                       = var.mysql_config.high_availability_mode
    standby_availability_zone  = var.mysql_config.high_availability_standby_availability_zone
  }
  maintenance_window {
    day_of_week                = var.mysql_config.maintenance_window_day_of_week
    start_hour                 = var.mysql_config.maintenance_window_start_hour
    start_minute               = var.mysql_config.maintenance_window_start_minute
  }
  storage {
    iops                       = var.mysql_config.storage_iops
    size_gb                    = var.mysql_config.storage_size_gb
  }
  identity {
    type                       = var.identity_type
    identity_ids               = var.mysql_config_dependency.identity_ids
  }

  depends_on = [module.PrivateDnsZoneVirtualNetworkLink.Current]
}
