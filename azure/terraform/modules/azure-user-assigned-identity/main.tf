resource "azurerm_user_assigned_identity" "UserManagedIdentity" {
  name                = "${var.rg_config.prefix}-${var.user_assigned_identity_config.name}"
  location            = var.rg_config.location 
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
}
