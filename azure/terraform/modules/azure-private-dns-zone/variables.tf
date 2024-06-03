variable "private_dns_zone_name" {
    type = string
}


variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}