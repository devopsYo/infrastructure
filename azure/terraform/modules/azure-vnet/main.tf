resource "azurerm_virtual_network" "VirtualNetwork" {
  name                = "${var.rg_config.prefix}-${var.vnet_config.name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  address_space       = var.vnet_config.address_space
}