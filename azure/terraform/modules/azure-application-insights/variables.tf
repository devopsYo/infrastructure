variable "app_insights_config" {
    type = object({
        name              = string
        application_type  = string
    })
}

variable "rg_config" {
    type = object({
        name              = string
        location          = string
        prefix            = string 
    })
}