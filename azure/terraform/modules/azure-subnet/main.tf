resource "azurerm_subnet" "Subnet" {
  name                 = var.subnet_config.name
  resource_group_name  = "${var.rg_config.prefix}-${var.rg_config.name}"
  virtual_network_name = var.subnet_config_dependency.virtual_network_name
  address_prefixes     = var.subnet_config.address_prefixes
  service_endpoints    = var.subnet_config.service_endpoints

  dynamic "delegation" {
    for_each = var.subnet_config.delegation_enable ? [1] : []  
    
    content {
      name                        = var.subnet_config.delegation.name
      service_delegation {       
        name                      = var.subnet_config.delegation.service_delegation_name
        actions                   = var.subnet_config.delegation.service_delegation_actions
      }
    }
  }
    
}
