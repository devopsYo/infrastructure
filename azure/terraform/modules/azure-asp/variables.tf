variable "asp_config" {
    type = object({
        name                            = string
        os_type                         = string
        sku_name                        = string
        worker_count                    = number
    })
}


variable "rg_config" {
    type = object({
        name                            = string
        location                        = string
        prefix                          = string 
    })
}
