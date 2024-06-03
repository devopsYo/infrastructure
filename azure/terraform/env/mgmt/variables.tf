variable "config" {
    type = object({
        env              = string
        project_name     = string
        plaque_name      = string
        location         = string
    })
}
