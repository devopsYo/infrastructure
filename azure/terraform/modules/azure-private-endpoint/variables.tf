variable "private_endpoint_config" {
    type = object({
        name                                            = string
        private_service_connection_subresource_names    = list(string)
        private_service_connection_is_manual_connection = bool
        private_dns_zone_group_name                     = string
    })
}

variable "private_endpoint_config_dependency" {
    type = object({
        subnet_id                                       = string
        private_service_connection_resource_id          = string
        private_service_connection_name                 = string
        private_dns_zone_id                             = string
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}