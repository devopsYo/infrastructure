variable "kv_secret_list_config" {
    type = list(object({
        isFileType                                    = bool
        name                                          = string
        value                                         = string
        tags                                          = map(string)
    }))
}

variable "kv_id" {
    type                         = string
}
