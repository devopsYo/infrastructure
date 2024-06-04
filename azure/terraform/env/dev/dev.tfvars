config = {   
    env                               = "dev"   
    plaque_list = [   
    {      
        rg_config                     = {   
            prefix                                     = "lv-fr"
            location                                   = "France Central"
            name                                       = "rg-001"  
        }             
        vnet_config                   = {     
            name                                         = "vnet-001"
            address_space                                = ["10.231.3.0/24"]
        }  
        ssh_key_config                = {
            name                                          = "ssh-pub-key-001"
            public_key                                    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDP1ruYwIfM7SAg/HGk1Z+mcyVFPwAEB+67FaeaxVULZiYxS27wKR23jT/LF8Dxa9YL9yh07Igg/zbpHWlsYSu3IK//kUC47mCvodLUrnCWKqqPLsTybYSviYU6VNtpztCrXz+c+V2+AtB6mLt7kGw6Hc5c45WT9DtGr94DOgUQn/G8+eMfe1/PNrpQkuo3lOR0jBdPxxaNzSDuQzZERhJ4PAf5Iq4/sikAsF6v6HyRNyHXGR0koprgOmPftLqW71InY4GpmBxYeTNxoDZz3C9DiqIgmeqLmdhlEL7KK3TTrQBwsisQGVB2nW724RAW3MTmG/5SpLZ9TrKPHgCY9kjnPxcbZA0+BozIKhGYMETK+B8XRPYp+g2rrh3/SV0gSP8LbiRGp0LOY9iy1+3vdMrePHWdLhvpe3rlOMTQcFndRBl9fUkk0QnJKsxuJAApS0DH95vD71PV2QqH4XZR1EiSeVha/G+GhYjyf/CKddvU4J4NCsUiw/dRU5KzZ2v1TME= generated-by-azure"
        }   
        subnet_man_config              = {
            name                                         = "lv-fr-man-001"
            address_prefixes                             = ["10.231.3.192/28"]
            service_endpoints                            = []
            delegation_enable                            = false
        }  
        subnet_prv_config              = {
            name                                         = "lv-fr-prv-001"
            address_prefixes                             = ["10.231.3.80/28"]
            service_endpoints                            = ["Microsoft.Storage"]
            delegation_enable                            = false
        }   
        subnet_sec_config              = {
            name                                         = "lv-fr-sec-001"
            address_prefixes                             = ["10.231.3.112/28"]
            service_endpoints                            = []
            delegation_enable                            = false
        }     
        subnet_app_config              = {
            name                                         = "lv-fr-app-001"
            address_prefixes                             = ["10.231.3.0/27"]
            service_endpoints                            = []
            delegation_enable                            = true
            delegation                                   = {
                name                                          = "Microsoft.Web.hostingEnvironments"
                service_delegation_name                       = "Microsoft.Web/hostingEnvironments"
                service_delegation_actions                    = ["Microsoft.Network/virtualNetworks/subnets/action"]
           }                                   
        }  
        subnet_bastion_config          = {
            name                                         = "AzureBastionSubnet"
            address_prefixes                             = ["10.231.3.128/26"]
            service_endpoints                            = []
            delegation_enable                            = false
        }      
        vm_mgmt_config                 = {     
            name                                         = "vm-mgmt-001"
            size                                         = "Standard_D4s_v3"
            ip_name                                      = "internal"
            private_ip_address_allocation                = "Dynamic"
            nic_name                                     = "vm-mgmt-001-nic"  
            user_name                                    = "azureuser"
            password                                     = "hwxi3vgSzHxrl7M"  
            disable_password_authentication              = false
            zone                                         = "2"
            os_disk_name                                 = "vm-mgmt-001-osdisk"
            os_disk_caching                              = "ReadWrite"
            os_disk_storage_account_type                 = "StandardSSD_LRS"
            source_image_publisher                       = "canonical"
            source_image_offer                           = "0001-com-ubuntu-server-jammy"
            source_image_sku                             = "22_04-lts-gen2"
            source_image_version                         = "latest"
            custom_data                                  = "../../scripts/custom-data/vm-mgmt-setup-1.0.0.yaml"
            managed_disk_attachment_config               = {
                name                                         = "vm-mgmt-001-datadisk_0"
                storage_account_type                         = "Premium_LRS"
                create_option                                = "Empty"
                disk_size_gb                                 = 512
                lun                                          = "1"
                caching                                      = "ReadWrite"
                network_access_policy                        = "DenyAll"
            }   
        }   
        vm_redis_config                = {     
            name                                         = "vm-redis-001"
            size                                         = "Standard_D4s_v3"
            ip_name                                      = "internal"
            private_ip_address_allocation                = "Dynamic"
            nic_name                                     = "vm-redis-001-nic"  
            user_name                                    = "azureuser"
            password                                     = "hwxi3vgSzHxrl7M"  
            disable_password_authentication              = true
            zone                                         = "2"
            os_disk_name                                 = "vm-redis-001-osdisk"
            os_disk_caching                              = "ReadWrite"
            os_disk_storage_account_type                 = "StandardSSD_LRS"
            source_image_publisher                       = "canonical"
            source_image_offer                           = "0001-com-ubuntu-server-jammy"
            source_image_sku                             = "22_04-lts-gen2"
            source_image_version                         = "latest"
            custom_data                                  = "../../scripts/custom-data/vm-redis-setup-1.0.0.yaml"
            managed_disk_attachment_config               = {
                name                                         = "vm-redis-001-datadisk_0"
                storage_account_type                         = "Premium_LRS"
                create_option                                = "Empty"
                disk_size_gb                                 = 512
                lun                                          = "1"
                caching                                      = "ReadWrite"
                network_access_policy                        = "DenyAll"
            }   
        }     
        bastion_config              = {     
            name                                         = "bastion-001"
            sku                                          = "Standard"
            tunneling_enabled                            = true
            ip_configuration_name                        = "configuration" 
            public_ip_name                               = "bastion-001-public-ip"
            public_ip_sku                                = "Standard"
            public_ip_allocation_method                  = "Static"
        }     
        storage_account_list_config = [{     
            name                                         = "lvfrsaexp001"
            private_dns_zone_suffix                      = ".blob.core.windows.net"
            private_dns_zone_virtual_network_link_name   = "dns-zone-vnet-link"
            account_tier                                 = "Standard"
            account_replication_type                     = "LRS"
            network_rules_default_action                 = "Deny"   
            public_network_access_enabled                = false                             
        }]   
        ase_config                   = {         
            name                                         = "ase-001"
            internal_load_balancing_mode                 = "Web, Publishing"
            zone_redundant                               = false
            asp_name                                     = "ase-001-asp"
            asp_os_type                                  = "Linux"
            asp_sku_name                                 = "I1v2"
            worker_count                                 = 1
        }     
        web_app_config               = {     
            name                                         = "alpha-configurator-wapp-001"
            https_only                                   = true
            always_on                                    = false
            minimum_tls_version                          = "1.2"
            container_registry_use_managed_identity      = true
            docker_image                                 = "lv-fr.azurecr.io/threekit-alpha-internal"
            docker_image_tag                             = "latest"
            identity_type                                = "UserAssigned"
            node_version                                 = "20-lts"
            app_settings             = {
            }
        }
        app_insights_config              = {
            name                                    = "app-insights-001"
            application_type                        = "Node.JS"
        }
        kv_config                               = {
            name                                       = "lv-fr-kv-001"
            private_dns_zone_suffix                    = ".vault.azure.net"
            private_dns_zone_virtual_network_link_name = "dns-zone-vnet-link"
            enabled_for_disk_encryption                = true
            soft_delete_retention_days                 = 7
            purge_protection_enabled                   = false
            sku_name                                   = "standard"
            private_endpoint_enable                    = 1
            private_endpoint_config                    = {
                name                                            = "kv-ep-001"
                subnet_name                                     = "kv-ep-001-subnet"
                address_prefixes                                = ["10.0.1.96/28"]
                private_service_connection_subresource_names    = ["vault"]
                private_service_connection_is_manual_connection = false
                private_dns_zone_group_name                     = "kv-ep-001-dns-zone-group-001"
            }
            key_permissions                         = [  
                                                         "Backup",
                                                         "Create",
                                                         "Delete",
                                                         "Import",
                                                         "Get",
                                                         "Purge",
                                                         "Recover",
                                                         "Restore",
                                                         "Update",
                                                         "Sign"
                                                      ]
            secret_permissions                      = [  
                                                         "Backup",
                                                         "Delete",
                                                         "Get",
                                                         "List",
                                                         "Purge",
                                                         "Recover",
                                                         "Restore",
                                                         "Set"
                                                      ]
            storage_permissions                     = [  
                                                         "Backup",
                                                         "Delete",
                                                         "DeleteSAS",
                                                         "Get",
                                                         "GetSAS",
                                                         "Purge",
                                                         "Recover",
                                                         "RegenerateKey",
                                                         "Restore",
                                                         "Set",
                                                         "SetSAS",
                                                         "Update"
                                                      ]
        }
        user_assigned_identity_config = {
            mysql   = {
                name                                    = "sql-admin-mid-001"
            }
            fcn_app = {
                name                                    = "fcn-app-mid-001"
            }
        }    
    }]
}