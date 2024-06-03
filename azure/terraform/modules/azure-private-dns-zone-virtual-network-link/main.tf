resource "azurerm_private_dns_zone_virtual_network_link" "PrivateDnsZoneVirtualNetworkLink" {
  name                  = var.private_dns_zone_virtual_network_link_name
  private_dns_zone_name = var.private_dns_zone_virtual_network_link_dependency.private_dns_zone_name
  virtual_network_id    = var.private_dns_zone_virtual_network_link_dependency.virtual_network_id
  resource_group_name   = "${var.rg_config.prefix}-${var.rg_config.name}"
}

