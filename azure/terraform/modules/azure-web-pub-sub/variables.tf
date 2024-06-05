variable "web_pub_sub_config" {
    type = object({
        name                          = string
        sku                           = string
        capacity                      = number
        public_network_access_enabled = bool
        live_trace                    = object({
           enabled                                = bool
           messaging_logs_enabled                 = bool
           connectivity_logs_enabled              = bool
        })
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}
