variable "kv_config" {
    type = object({
        name                                       = string
        private_dns_zone_suffix                    = string
        private_dns_zone_virtual_network_link_name = string
        enabled_for_disk_encryption                = bool
        soft_delete_retention_days                 = number
        purge_protection_enabled                   = bool     
        sku_name                                   = string
        key_permissions                            = list(string)
        secret_permissions                         = list(string)
        storage_permissions                        = list(string)
        private_endpoint_enable                    = number
        private_endpoint_config                    = optional(object({
            name                                                        = string
            private_service_connection_subresource_names                = list(string)
            private_service_connection_is_manual_connection             = bool
            private_dns_zone_group_name                                 = string
        })) 
    })
}

variable "rg_config" {
    type = object({
        name                                       = string
        location                                   = string
        prefix                                     = string 
    })
}

variable "kv_config_dependency" {
    type = object({
        subnet_id                                  = string
        virtual_network_id                         = string
    })
}