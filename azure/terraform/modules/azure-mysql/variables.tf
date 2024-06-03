variable "mysql_config" {
    type = object({
        name                                        = string
        private_dns_zone_suffix                     = string
        private_dns_zone_virtual_network_link_name  = string
        administrator_login                         = string  
        administrator_password                      = string
        backup_retention_days                       = number
        geo_redundant_backup_enabled                = bool
        sku_name                                    = string
        version                                     = string 
        zone                                        = number
        maintenance_window_day_of_week              = number
        maintenance_window_start_hour               = number
        maintenance_window_start_minute             = number
        storage_iops                                = number
        storage_size_gb                             = number
        high_availability_mode                      = string
        high_availability_standby_availability_zone = number
    })
}

variable "rg_config" {
    type = object({
        name               = string
        location           = string
        prefix             = string 
    })
}

variable "mysql_config_dependency" {
    type = object({
        identity_ids       = list(string)
        virtual_network_id = string
        subnet_id          = string
    })
}

variable "identity_type" {
    type    = string
    default = "UserAssigned"
}
