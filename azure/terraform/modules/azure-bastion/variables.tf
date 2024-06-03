variable "bastion_config" {
    type = object({
        name                               = string
        sku                                = string
        tunneling_enabled                  = bool
        ip_configuration_name              = string
        public_ip_name                     = string
        public_ip_sku                      = string
        public_ip_allocation_method        = string
    })
}

variable "bastion_config_dependency" {
    type = object({
        subnet_id                                           = string
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}

