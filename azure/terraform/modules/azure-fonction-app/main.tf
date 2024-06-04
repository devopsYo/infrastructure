module "StorageAccount" {
  source                              = "../../modules/azure-storage-account"
  storage_account_config              = var.fcn_app_config.storage_account_config
  rg_config                           = var.rg_config
}


resource "azurerm_linux_function_app" "FunctionApp" {
  name                                     = "${var.rg_config.prefix}-${var.fcn_app_config.name}"
  resource_group_name                      = "${var.rg_config.prefix}-${var.rg_config.name}"
  location                                 = var.rg_config.location
  storage_account_name                     = module.StorageAccount.Current.name
  storage_account_access_key               = module.StorageAccount.Current.primary_access_key
  service_plan_id                          = var.fcn_app_config_dependency.service_plan_id
  https_only                               = var.fcn_app_config.https_only
  site_config {
    always_on                              = var.fcn_app_config.always_on
    application_insights_connection_string = var.fcn_app_config_dependency.application_insights_connection_string
    application_insights_key               = var.fcn_app_config_dependency.application_insights_key
    application_stack {
      node_version                         = var.fcn_app_config.node_version
    }
  }
  identity {
    type                     = var.fcn_app_config.identity_type
    identity_ids             = var.fcn_app_config_dependency.identity_ids
  }
}
