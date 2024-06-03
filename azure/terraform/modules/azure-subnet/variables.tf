variable "subnet_config" {
    type = object({
        name                            = string
        address_prefixes                = list(string)
        service_endpoints               = list(string)
        delegation_enable               = bool
        delegation                      = optional(object({
            name                                    = string
            service_delegation_name                 = string
            service_delegation_actions              = list(string)
        }))
    })
}

variable "subnet_config_dependency" {
    type = object({
        virtual_network_name            = string
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}