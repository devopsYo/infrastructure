variable "app_registration_config" {
    type                                   = object({ 
        display_name                                   = string
        prefix_identifier_uri                          = string
        suffix_identifier_uri                          = string
        sign_in_audience                               = string
        api                                = object({
            mapped_claims_enabled                      = bool
            requested_access_token_version             = number
            oauth2_permission_scope        = object({
                admin_consent_description              = string
                admin_consent_display_name             = string
                enabled                                = bool
                type                                   = string
                user_consent_description               = string
                user_consent_display_name              = string
                value                                  = string
            })       
        })
        app_role                            = object({
            user                            = object({
                allowed_member_types                   = list(string)
                description                            = string
                display_name                           = string
                enabled                                = bool
                value                                  = string      
            })
            server                          = object({
                allowed_member_types                   = list(string)
                description                            = string
                display_name                           = string
                enabled                                = bool
                value                                  = string      
            })      
        })
        optional_claims                     = object({
            access_token                        = object({
                auth_time                           = object({
                    name                                               = string
                    source                                             = string
                    essential                                          = bool
                    additional_properties                              = list(string) 
                })
                upn                                 = object({
                    name                                              = string
                    source                                            = string
                    essential                                         = bool
                    additional_properties                             = list(string) 
                })     
            })
        })
        web                                 = object({
            homepage_url                               = string
            logout_url                                 = string
            redirect_uris                              = list(string)
            implicit_grant                  = object({
                access_token_issuance_enabled          = bool
                id_token_issuance_enabled              = bool
            })     
        })
        api_access                          = object({ 
            microsoft_graph                     = object({
                api_client_id                             = string
                scope_ids                                 = list(string)
            })
            azure_service_management             = object({
                api_client_id                             = string
                scope_ids                                 = list(string)
            })
        })
    })
}

        
  
