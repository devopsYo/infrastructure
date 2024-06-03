resource "azurerm_application_insights" "ApplicationInsights" {
  name                = "${var.rg_config.prefix}-${var.app_insights_config.name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  application_type    = var.app_insights_config.application_type
}


