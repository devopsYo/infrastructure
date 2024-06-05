resource "azurerm_web_pubsub" "WebPubSub" {
  name                = "${var.rg_config.prefix}-${var.web_pub_sub_config.name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"

  sku      = var.web_pub_sub_config.sku
  capacity = var.web_pub_sub_config.capacity

  public_network_access_enabled = var.web_pub_sub_config.public_network_access_enabled

  live_trace {
    enabled                   = var.web_pub_sub_config.live_trace.enabled
    messaging_logs_enabled    = var.web_pub_sub_config.live_trace.messaging_logs_enabled
    connectivity_logs_enabled = var.web_pub_sub_config.live_trace.connectivity_logs_enabled
  }

}