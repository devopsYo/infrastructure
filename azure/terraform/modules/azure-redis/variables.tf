variable "redis_config" {
    type = object({
        name                = string
        capacity            = string
        family              = string
        sku_name            = string
        enable_non_ssl_port = bool
        redis_version       = string
        minimum_tls_version = string
    })
}

variable "rg_config" {
    type = object({
        name               = string
        location           = string
        prefix             = string 
    })
}
