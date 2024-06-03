resource "azurerm_network_interface" "NIC" {
  name                = "${var.rg_config.prefix}-${var.vm_config.nic_name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"

  ip_configuration {
    name                          = "${var.rg_config.prefix}-${var.vm_config.ip_name}"
    subnet_id                     = var.vm_config_dependency.subnet_id
    private_ip_address_allocation = var.vm_config.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "VirtualMachine" {
  name                            = "${var.rg_config.prefix}-${var.vm_config.name}"
  location                        = var.rg_config.location
  resource_group_name             = "${var.rg_config.prefix}-${var.rg_config.name}"
  size                            = var.vm_config.size
  admin_username                  = var.vm_config.user_name
  admin_password                  = var.vm_config.password
  disable_password_authentication = var.vm_config.disable_password_authentication
  zone                            = var.vm_config.zone
  network_interface_ids           = [
    azurerm_network_interface.NIC.id,
  ]
  custom_data                     = filebase64(var.vm_config.custom_data)
  admin_ssh_key {
    username                      = var.vm_config.user_name
    public_key                    = var.vm_config_dependency.public_key
  }

  os_disk {
    caching                       = var.vm_config.os_disk_caching
    storage_account_type          = var.vm_config.os_disk_storage_account_type
    name                          = "${var.rg_config.prefix}-${var.vm_config.os_disk_name}"

  }
  source_image_reference {
    publisher                     = var.vm_config.source_image_publisher
    offer                         = var.vm_config.source_image_offer
    sku                           = var.vm_config.source_image_sku
    version                       = var.vm_config.source_image_version
  }
}

module "VmDataDiskAttachment" {
  source                                       = "../../modules/azure-vm-data-disk-attachment"
  vm_managed_disk_attachment_config            = var.vm_config.managed_disk_attachment_config
  vm_managed_disk_attachment_config_dependency = {
    virtual_machine_id                             = azurerm_linux_virtual_machine.VirtualMachine.id
    zone                                           = azurerm_linux_virtual_machine.VirtualMachine.zone
  }
  rg_config                                    = var.rg_config

}
