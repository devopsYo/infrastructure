resource "azurerm_redis_cache" "RedisCache" {
  name                = "${var.rg_config.prefix}-${var.redis_config.name}"
  location            = var.rg_config.location
  resource_group_name = "${var.rg_config.prefix}-${var.rg_config.name}"
  capacity            = var.redis_config.capacity
  family              = var.redis_config.family
  sku_name            = var.redis_config.sku_name
  enable_non_ssl_port = var.redis_config.enable_non_ssl_port
  redis_version       = var.redis_config.redis_version
  minimum_tls_version = var.redis_config.minimum_tls_version

  redis_configuration {
  }
}

