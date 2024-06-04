variable "storage_account_config" {
    type = object({
        name                                       = string
        private_dns_zone_suffix                    = string
        private_dns_zone_virtual_network_link_name = string
        account_tier                               = string
        account_replication_type                   = string
        network_rules_default_action               = string  
        public_network_access_enabled              = bool     
    })
}

#variable "storage_account_config_dependency" {
#    type = optional(object({
#        subnet_id                     = string
#        virtual_network_id            = string
#    }))
#} 
 
variable "rg_config" { 
    type = object({ 
        name                          = string
        location                      = string
        prefix                        = string 
    })
}