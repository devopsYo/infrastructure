variable "vm_managed_disk_attachment_config" {
    type = object({
        name                            = string
        storage_account_type            = string
        create_option                   = string
        disk_size_gb                    = number
        lun                             = string
        caching                         = string
        network_access_policy           = string
    })
}

variable "vm_managed_disk_attachment_config_dependency" {
    type = object({
        virtual_machine_id              = string
        zone                            = string
    })
}

variable "rg_config" {
    type = object({
        name                            = string
        location                        = string
        prefix                          = string 
    })
}