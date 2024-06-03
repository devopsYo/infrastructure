module "VmMgmt" {
  source                                 = "../../modules/azure-vm"
  vm_config                              = var.vm_mgmt_config 
  vm_config_dependency                   = var.vm_mgmt_config_dependency
  rg_config                              = var.rg_config
}
