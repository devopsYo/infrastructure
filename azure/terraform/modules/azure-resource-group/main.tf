resource "azurerm_resource_group" "ResourceGroup" {
  name     = "${var.rg_config.prefix}-${var.rg_config.name}"
  location = var.rg_config.location 
}


