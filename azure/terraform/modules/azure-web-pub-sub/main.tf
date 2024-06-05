resource "azurerm_web_pubsub" "WebPubSub" {
  name                = "tfex-webpubsub"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku      = "Standard_S1"
  capacity = 1

  public_network_access_enabled = true

  live_trace {
    enabled                   = true
    messaging_logs_enabled    = true
    connectivity_logs_enabled = false
  }

}