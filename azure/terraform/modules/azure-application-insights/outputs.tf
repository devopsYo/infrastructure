output "Current" {
    value = azurerm_application_insights.ApplicationInsights
}

output "AppSettings" {
    value = {
        APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.ApplicationInsights.instrumentation_key
        APPLICATIONINSIGHTS_CONNECTION_STRING = azurerm_application_insights.ApplicationInsights.connection_string
    }
}

