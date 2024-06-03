module "VmRedis" {
  source                                 = "../../modules/azure-vm"
  vm_config                              = var.vm_redis_config 
  vm_config_dependency                   = var.vm_redis_config_dependency
  rg_config                              = var.rg_config
}

