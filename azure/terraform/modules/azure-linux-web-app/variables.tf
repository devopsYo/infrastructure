variable "web_app_config" {
    type = object({
        name                                          = string
        https_only                                    = bool
        always_on                                     = bool
        minimum_tls_version                           = string
        container_registry_use_managed_identity       = bool
        docker_image                                  = string
        docker_image_tag                              = string
        identity_type                                 = string
        node_version                                  = string  
        auth_settings_v2                              = object({
            auth_enabled                                          = bool
            require_authentication                                = bool
            unauthenticated_action                                = string
            login                                                 = object ({
                token_store_enabled                                           = bool
            })
            active_directory_v2                                   = object({
                client_id                                             = string
                tenant_auth_endpoint                                  = string
                client_secret_setting_name                            = string
            })
        })
    })
}


variable "web_app_config_dependency" {
    type = object({
        service_plan_id                               = string
        app_settings                                  = map(string)
    })
}


variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}