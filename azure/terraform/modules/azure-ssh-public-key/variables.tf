variable "ssh_public_key_config" {
    type = object({
        name                = string
        public_key          = string
    })
}

variable "rg_config" {
    type = object({
        name               = string
        location           = string
        prefix             = string 
    })
}
