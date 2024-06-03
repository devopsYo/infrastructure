variable "ase_config" {
    type = object({
        name                            = string
        internal_load_balancing_mode    = string
        zone_redundant                  = bool
        asp_name                        = string
        asp_os_type                     = string
        asp_sku_name                    = string
        worker_count                    = number
    })
}


 variable "ase_config_dependency" {
    type = object({
        subnet_id          = string
    })
 }

variable "rg_config" {
    type = object({
        name                            = string
        location                        = string
        prefix                          = string 
    })
}
