variable "vm_redis_config" {
    type = object({
        name                            = string
        size                            = string
        ip_name                         = string
        private_ip_address_allocation   = string
        nic_name                        = string
        user_name                       = string
        password                        = string
        disable_password_authentication = bool
        zone                            = string
        os_disk_name                    = string
        os_disk_caching                 = string
        os_disk_storage_account_type    = string
        source_image_publisher          = string
        source_image_offer              = string
        source_image_sku                = string
        source_image_version            = string
        custom_data                     = string
        managed_disk_attachment_config  =  object({
            name                                     = string
            storage_account_type                     = string
            create_option                            = string
            disk_size_gb                             = number
            lun                                      = string
            caching                                  = string
            network_access_policy                    = string
        })
    })
}

variable "vm_redis_config_dependency" {
    type = object({
        public_key                      = string
        subnet_id                       = string
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}
