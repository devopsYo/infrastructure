variable "fcn_app_config" {
    type = object({
        name                        = string
        identity_type               = string
        https_only                  = bool
        always_on                   = bool
        node_version                = string
        storage_account_config      = object({
            name                                          = string
            private_dns_zone_suffix                       = string
            private_dns_zone_virtual_network_link_name    = string
            account_tier                                  = string
            account_replication_type                      = string
            network_rules_default_action                  = string  
            public_network_access_enabled                 = bool                            
            private_endpoint_enable                       = number
            private_endpoint_config              = optional(object({
                name                                            = string
                private_service_connection_subresource_names    = list(string)
                private_service_connection_is_manual_connection = bool
                private_dns_zone_group_name                     = string
            }))  
        })      
    })
}

variable "fcn_app_config_dependency" {
    type = object({
        service_plan_id                        = string
        identity_ids                           = list(string)
        application_insights_connection_string = string                                                                                                        
        application_insights_key               = string
    })
}



variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}
