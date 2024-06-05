module "ResourceGroup" {
  source                                      = "../../modules/azure-resource-group"
  count                                       = length(var.infra_config.plaque_list)
  rg_config                                   = var.infra_config.plaque_list[count.index].rg_config
}   

/*
module "Vnet" {
  source                                      = "../../modules/azure-vnet"
  count                                       = length(var.infra_config.plaque_list)
  vnet_config                                 = var.infra_config.plaque_list[count.index].vnet_config
  rg_config                                   = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                  = [
    module.ResourceGroup.Current
  ]
}
*/

/*
module "PublicKey" {
  source                                      = "../../modules/azure-ssh-public-key"
  count                                       = length(var.infra_config.plaque_list)
  ssh_public_key_config                       = var.infra_config.plaque_list[count.index].ssh_key_config
  rg_config                                   = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                  = [
    module.ResourceGroup.Current,
  ]
}
*/

/*
module "SubnetMan" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_man_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}

module "SubnetPrv" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_prv_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}

module "SubnetSec" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_sec_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}

module "SubnetApp" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_app_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}

module "SubnetBastion" {
  source                                     = "../../modules/azure-subnet"
  count                                      = length(var.infra_config.plaque_list)
  subnet_config                              = var.infra_config.plaque_list[count.index].subnet_bastion_config
  subnet_config_dependency                   = {
    virtual_network_name                           = module.Vnet[count.index].Current.name
  }
  rg_config                                  = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                 = [
    module.ResourceGroup.Current,
  ]
}
*/


/*
module "Redis" {
  source                                       = "../../modules/azure-vm-redis"
  count                                        = length(var.infra_config.plaque_list)
  vm_redis_config                              = var.infra_config.plaque_list[count.index].vm_redis_config
  vm_redis_config_dependency                   = {
    public_key                                     = module.PublicKey[count.index].Current.public_key
    subnet_id                                      = module.SubnetPrv[count.index].Current.id
  }
  rg_config                                    = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                   = [
    module.ResourceGroup.Current,
  ]
}
*/

/*
module "Bastion" {
  source                                       = "../../modules/azure-bastion"
  count                                        = length(var.infra_config.plaque_list)
  bastion_config                               = var.infra_config.plaque_list[count.index].bastion_config
  bastion_config_dependency                    = {
    subnet_id                                       = module.SubnetBastion[count.index].Current.id
  }
  rg_config                                    = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                   = [
    module.ResourceGroup.Current,
  ]  
}
*/

module "StorageAccountList" {
  source                                        = "../../modules/azure-storage-account-list"
  count                                         = length(var.infra_config.plaque_list)
  storage_account_list_config                   = var.infra_config.plaque_list[count.index].storage_account_list_config
  rg_config                                     = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                    = [
    module.ResourceGroup.Current
  ]
}

module "Asp" {
  source                                        = "../../modules/azure-asp"
  count                                         = length(var.infra_config.plaque_list)
  asp_config                                    = var.infra_config.plaque_list[count.index].asp_config
  rg_config                                     = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                    = [
    module.ResourceGroup.Current,
  ]
}



module "WebApp" {
  source                                        = "../../modules/azure-linux-web-app-list"
  count                                         = length(var.infra_config.plaque_list)
  web_app_list_config                           = var.infra_config.plaque_list[count.index].web_app_list_config  
  web_app_config_dependency                     = {
      service_plan_id                           = module.Asp[count.index].AppServicePlan.id
  }
  //identity_ids                                  = [ data.azurerm_user_assigned_identity.UserManagedIdentity.id ]
  //container_registry_managed_identity_client_id = data.azurerm_user_assigned_identity.UserManagedIdentity.client_id
  rg_config                                     = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                    = [
    module.ResourceGroup.Current
  ]
}





module "KeyVault" {
  source                                        = "../../modules/azure-key-vault"
  count                                         = length(var.infra_config.plaque_list)
  kv_config                                     = var.infra_config.plaque_list[count.index].kv_config
  rg_config                                     = var.infra_config.plaque_list[count.index].rg_config
  depends_on                                    = [
    module.ResourceGroup.Current
  ]
}








