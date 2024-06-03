variable "container_registry_config" {
    type = object({
        project_name        = string
        location            = string    
        resource_group_name = string     
    })
}