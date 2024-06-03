module "UserManagedIdentity" {
  source                              = "../../modules/azure-user-assigned-identity"
  count                               = length(var.user_assigned_identity_list_config)
  user_assigned_identity_config       = var.user_assigned_identity_list_config[count.index]
  rg_config                           = var.rg_config
}
