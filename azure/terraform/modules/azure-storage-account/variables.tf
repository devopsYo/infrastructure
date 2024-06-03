variable "storage_account_config" {
    type = object({
        name                                       = string
        private_dns_zone_suffix                    = string
        private_dns_zone_virtual_network_link_name = string
        account_tier                               = string
        account_replication_type                   = string
        network_rules_default_action               = string  
        public_network_access_enabled              = bool     
        private_endpoint_enable                    = number
        private_dns_enable                         = number
        private_endpoint_config                    = object({
            name                                               = string
            private_service_connection_subresource_names       = list(string)
            private_service_connection_is_manual_connection    = bool
            private_dns_zone_group_name                        = string
        })
    })
}

variable "storage_account_config_dependency" {
    type = object({
        subnet_id                     = string
        virtual_network_id            = string
    }) 
} 
 
variable "rg_config" { 
    type = object({ 
        name                          = string
        location                      = string
        prefix                        = string 
    })
}