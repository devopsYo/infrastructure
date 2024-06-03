variable "kv_secret_config" {
    type = object({
        isFileType                                    = bool
        name                                          = string
        value                                         = string
        tags                                          = map(string)
    })
}

variable "kv_id" {
    type                         = string
}
