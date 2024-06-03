output "AppServicePlan" {
    value = azurerm_service_plan.AppServicePlan
}

output "Current" {
    value = azurerm_app_service_environment_v3.Ase
}

