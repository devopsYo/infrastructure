variable "infra_config" {
    type      = object({
        env              = string
        plaque_list      = list(object({
            rg_config                    = object({
                prefix                                        = string
                name                                          = string
                location                                      = string
            })
            vnet_config                 = object({
                name                                          = string
                address_space                                 = list(string)
            })    
            ssh_key_config       = object({
                name                                          = string
                public_key                                    = string
            })
            subnet_man_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            subnet_prv_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            subnet_sec_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            subnet_app_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            subnet_bastion_config             = object({
                name                                          = string
                address_prefixes                              = list(string)
                service_endpoints                             = list(string)
                delegation_enable                             = bool
                delegation                                    = optional(object({
                    name                                                  = string
                    service_delegation_name                               = string
                    service_delegation_actions                            = list(string)
                }))
            })
            vm_mgmt_config              = object({
                name                                          = string
                size                                          = string
                ip_name                                       = string
                private_ip_address_allocation                 = string
                nic_name                                      = string
                user_name                                     = string
                password                                      = string
                disable_password_authentication               = bool
                zone                                          = string
                os_disk_name                                  = string
                os_disk_caching                               = string
                os_disk_storage_account_type                  = string
                source_image_publisher                        = string
                source_image_offer                            = string
                source_image_sku                              = string
                source_image_version                          = string
                custom_data                                   = string
                managed_disk_attachment_config                = object({
                    name                                                  = string
                    storage_account_type                                  = string
                    create_option                                         = string
                    disk_size_gb                                          = number
                    lun                                                   = string
                    caching                                               = string
                    network_access_policy                                 = string
                })
            })  
            vm_redis_config               = object({
                name                                          = string
                size                                          = string
                ip_name                                       = string
                private_ip_address_allocation                 = string
                nic_name                                      = string
                user_name                                     = string
                password                                      = string
                disable_password_authentication               = bool
                zone                                          = string
                os_disk_name                                  = string
                os_disk_caching                               = string
                os_disk_storage_account_type                  = string
                source_image_publisher                        = string
                source_image_offer                            = string
                source_image_sku                              = string
                source_image_version                          = string
                custom_data                                   = string
                managed_disk_attachment_config                = object({
                    name                                                  = string
                    storage_account_type                                  = string
                    create_option                                         = string
                    disk_size_gb                                          = number
                    lun                                                   = string
                    caching                                               = string
                    network_access_policy                                 = string
                })
            }) 
            bastion_config              = object({
                name                                          = string
                sku                                           = string
                tunneling_enabled                             = bool
                ip_configuration_name                         = string
                public_ip_name                                = string
                public_ip_sku                                 = string
                public_ip_allocation_method                   = string               
            })
            storage_account_list_config = list(object({
                name                                          = string
                private_dns_zone_suffix                       = string
                private_dns_zone_virtual_network_link_name    = string
                account_tier                                  = string
                account_replication_type                      = string
                network_rules_default_action                  = string  
                public_network_access_enabled                 = bool                            
            }))  
            ase_config                  = object({           
                name                                          = string
                internal_load_balancing_mode                  = string
                zone_redundant                                = bool
                asp_name                                      = string
                asp_os_type                                   = string
                asp_sku_name                                  = string 
                worker_count                                  = number            
            })             
            web_app_config                  = object({
                name                                          = string
                https_only                                    = bool
                always_on                                     = bool
                minimum_tls_version                           = string
                container_registry_use_managed_identity       = bool
                docker_image                                  = string
                docker_image_tag                              = string
                identity_type                                 = string
                node_version                                  = string
                app_settings                                  = map(string)                        
            })   
            app_insights_config             = object({
                name                                          = string
                application_type                              = string
            })        
            kv_config                           = object({
                name                                          = string
                private_dns_zone_suffix                       = string
                private_dns_zone_virtual_network_link_name    = string
                enabled_for_disk_encryption                   = bool
                soft_delete_retention_days                    = number
                purge_protection_enabled                      = bool
                sku_name                                      = string
                key_permissions                               = list(string)
                secret_permissions                            = list(string)
                storage_permissions                           = list(string)   
                private_endpoint_enable                       = number
                private_endpoint_config              = optional(object({
                    name                                            = string
                    private_service_connection_subresource_names    = list(string)
                    private_service_connection_is_manual_connection = bool
                    private_dns_zone_group_name                     = string
                }))
            })
            user_assigned_identity_config   = object({
                mysql                                = object({
                    name                                          = string
                })
                fcn_app                              = object({
                    name                                          = string
                })
            })                                    
        }))                  
    })
}

