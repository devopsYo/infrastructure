module "VmElk" {
  source                                 = "../../modules/azure-vm"
  count                                  = length(var.vm_elk_list_config)
  vm_config                              = var.vm_elk_list_config[count.index]
  vm_config_dependency                   = var.vm_elk_config_dependency
  rg_config                              = var.rg_config
}

