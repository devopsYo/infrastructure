resource "azurerm_managed_disk" "ManagedDisk" {
  name                  = var.vm_managed_disk_attachment_config.name
  location              = var.rg_config.location
  resource_group_name   = "${var.rg_config.prefix}-${var.rg_config.name}"
  storage_account_type  = var.vm_managed_disk_attachment_config.storage_account_type
  create_option         = var.vm_managed_disk_attachment_config.create_option
  disk_size_gb          = var.vm_managed_disk_attachment_config.disk_size_gb
  network_access_policy = var.vm_managed_disk_attachment_config.network_access_policy
  zone                  = var.vm_managed_disk_attachment_config_dependency.zone
}

resource "azurerm_virtual_machine_data_disk_attachment" "VmDataDiskAttachment" {
  managed_disk_id    = azurerm_managed_disk.ManagedDisk.id
  virtual_machine_id = var.vm_managed_disk_attachment_config_dependency.virtual_machine_id
  lun                = var.vm_managed_disk_attachment_config.lun
  caching            = var.vm_managed_disk_attachment_config.caching
}
