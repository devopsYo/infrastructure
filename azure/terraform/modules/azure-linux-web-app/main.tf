resource "azurerm_linux_web_app" "WebApp" {
  name                                              = "${var.rg_config.prefix}-${var.web_app_config.name}"
  location                                          = var.rg_config.location
  resource_group_name                               = "${var.rg_config.prefix}-${var.rg_config.name}"
  service_plan_id                                   = var.web_app_config_dependency.service_plan_id
  https_only                                        = var.web_app_config.https_only
  site_config {                             
    always_on                                       = var.web_app_config.always_on
    minimum_tls_version                             = var.web_app_config.minimum_tls_version
    //container_registry_managed_identity_client_id = var.web_app_config.container_registry_managed_identity_client_id
    //container_registry_use_managed_identity       = var.web_app_config.container_registry_use_managed_identity
    application_stack {
      //docker_image                                = var.web_app_config.docker_image
      //docker_image_tag                            = var.web_app_config.docker_image_tag
      node_version                                  = var.web_app_config.node_version
    }
    /*identity {
      type                                          = var.web_app_config.identity_type
      identity_ids                                  = var.web_app_config.identity_ids
    }*/
  }
  auth_settings_v2 {
    auth_enabled                                    = var.web_app_config.auth_settings_v2.auth_enabled
    require_authentication                          = var.web_app_config.auth_settings_v2.require_authentication
    unauthenticated_action                          = var.web_app_config.auth_settings_v2.unauthenticated_action
    login {    
      token_store_enabled                           = var.web_app_config.auth_settings_v2.login.token_store_enabled
    }    
    active_directory_v2 {    
      client_id                                     = var.web_app_config.auth_settings_v2.active_directory_v2.client_id
      tenant_auth_endpoint                          = var.web_app_config.auth_settings_v2.active_directory_v2.tenant_auth_endpoint
      client_secret_setting_name                    = var.web_app_config.auth_settings_v2.active_directory_v2.client_secret_setting_name
    }    
  }    
  app_settings                                      = var.web_app_config_dependency.app_settings                  
  
}