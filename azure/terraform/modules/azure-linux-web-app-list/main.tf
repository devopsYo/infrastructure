module "WebApp" {
  source                              = "../../modules/azure-linux-web-app"
  count                               = length(var.web_app_list_config)
  web_app_config                      = var.web_app_list_config[count.index]
  web_app_config_dependency           = var.web_app_config_dependency
  rg_config                           = var.rg_config
}