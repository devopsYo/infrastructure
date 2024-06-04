#resource "azurerm_app_service_environment_v3" "Ase" {
#  name                          = "${var.rg_config.prefix}-${var.ase_config.name}"
#  resource_group_name           = "${var.rg_config.prefix}-${var.rg_config.name}"
#  subnet_id                     = var.ase_config_dependency.subnet_id
#  internal_load_balancing_mode  = var.ase_config.internal_load_balancing_mode
#  zone_redundant                = var.ase_config.zone_redundant
#} 


resource "azurerm_service_plan" "AppServicePlan" {
  name                          = "${var.rg_config.prefix}-${var.ase_config.asp_name}"
  resource_group_name           = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                      = var.rg_config.location
  os_type                       = var.ase_config.asp_os_type
  sku_name                      = var.ase_config.asp_sku_name
  worker_count                  = var.ase_config.worker_count
}