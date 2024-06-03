variable "rg_config" {
    type = object({
        name     = string
        location = string 
        prefix   = string   
    })
}