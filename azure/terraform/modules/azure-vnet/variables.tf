variable "vnet_config" {
    type = object({
        address_space = list(string) 
        name          = string
    })
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}
