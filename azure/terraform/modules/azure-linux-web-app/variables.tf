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
        app_settings                                  = map(string)
    })
}


variable "web_app_config_dependency" {
    type = object({
        service_plan_id                               = string
        app_settings_app_insights                     = map(string)
    })
}


variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}