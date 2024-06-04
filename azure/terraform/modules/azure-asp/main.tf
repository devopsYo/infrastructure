resource "azurerm_service_plan" "AppServicePlan" {
  name                          = "${var.rg_config.prefix}-${var.asp_config.name}"
  resource_group_name           = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                      = var.rg_config.location
  os_type                       = var.asp_config.os_type
  sku_name                      = var.asp_config.sku_name
  worker_count                  = var.asp_config.worker_count
}