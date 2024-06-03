data "azurerm_subscription" "current" {
}

data "azuread_service_principal" "ServicePrincipalACR" {
  display_name = "${var.container_registry_config.project_name}-acr-sp"
}

data "azuread_service_principal" "ServicePrincipalARM" {
  display_name = "${var.container_registry_config.project_name}-arm-sp"
}

resource "azurerm_user_assigned_identity" "UserManagedIdentity" {
  name                = "${var.container_registry_config.project_name}-pull-umi"
  location            = var.container_registry_config.location 
  resource_group_name = var.container_registry_config.resource_group_name
}

resource "azurerm_container_registry" "ContainerRegistry" {
  name                = "${var.container_registry_config.project_name}CR"
  resource_group_name = var.container_registry_config.resource_group_name
  location            = var.container_registry_config.location
  sku                 = "Basic"
}

/*
resource "azurerm_role_assignment" "AcrPull" {
  scope                = azurerm_container_registry.ContainerRegistry.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.UserManagedIdentity.principal_id
}

resource "azurerm_role_assignment" "AcrPush" {
  scope                = azurerm_container_registry.ContainerRegistry.id
  role_definition_name = "AcrPush"
  principal_id         = data.azuread_service_principal.ServicePrincipalACR.object_id
}

/*
resource "azurerm_role_assignment" "WebsiteContributor" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Website Contributor"
  principal_id         = data.azuread_service_principal.ServicePrincipalARM.object_id
}
*/