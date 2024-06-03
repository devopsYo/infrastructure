resource "azurerm_public_ip" "PublicIP" {
  name                = "${var.rg_config.prefix}-${var.bastion_config.public_ip_name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  allocation_method   = var.bastion_config.public_ip_allocation_method
  sku                 = var.bastion_config.public_ip_sku
}

resource "azurerm_bastion_host" "Bastion" {
  name                = "${var.rg_config.prefix}-${var.bastion_config.name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  sku                 = var.bastion_config.sku
  tunneling_enabled   = var.bastion_config.tunneling_enabled

  ip_configuration {
    name                 = "${var.rg_config.prefix}-${var.bastion_config.ip_configuration_name}"
    subnet_id            = var.bastion_config_dependency.subnet_id
    public_ip_address_id = azurerm_public_ip.PublicIP.id
  }
}