provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source   = "../../modules/azure-resource-group"
  rg_config = {
    project_name = var.config.project_name
    plaque_name  = var.config.plaque_name
    env          = var.config.env
    location     = var.config.location
  }
}

module "ContainerRegistry" {
  source              = "../../modules/azure-container-registry"
  container_registry_config = {
    project_name        = var.config.project_name
    location            = var.config.location
    resource_group_name = module.ResourceGroup.current.name
  }
  depends_on = [
    module.ResourceGroup
  ]
}
/*
module "KeyVault" {
  source              = "../../modules/azure-key-vault"
  key_vault_config = {
    project_name        = var.config.project_name
    location            = var.config.location
    resource_group_name = module.ResourceGroup.current.name
  }
  depends_on = [
    module.ResourceGroup
  ]
}
*/


