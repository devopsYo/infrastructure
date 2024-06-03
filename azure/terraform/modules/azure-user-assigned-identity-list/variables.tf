variable "user_assigned_identity_list_config" {
    type = list(object({
        name                                          = string
    }))   
}

variable "rg_config" {
    type = object({
        name          = string
        location      = string
        prefix        = string 
    })
}
