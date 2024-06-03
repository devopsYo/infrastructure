resource "azurerm_ssh_public_key" "PublicKey" {
  name                = "${var.rg_config.prefix}-${var.ssh_public_key_config.name}"
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  location            = var.rg_config.location
  public_key          = var.ssh_public_key_config.public_key
}

