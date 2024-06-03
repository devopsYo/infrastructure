#requires -PSEdition Core

terraform import module.Ase.azurerm_subnet.Subnet /subscriptions/8c15ad6a-f326-4fa7-8947-a71c11e8c0dd/resourceGroups/cl7-eu2-amer-rg-001/providers/Microsoft.Network/virtualNetworks/cl7-eu2-amer-vnet-001/subnets/cl7-eu2-amer-ase-001-subnet

terraform import module.Ase.azurerm_app_service_environment_v3.Ase /subscriptions/8c15ad6a-f326-4fa7-8947-a71c11e8c0dd/resourceGroups/cl7-eu2-amer-rg-001/providers/Microsoft.Web/hostingEnvironments/cl7-eu2-amer-ase

terraform import module.Ase.azurerm_service_plan.AppServicePlan /subscriptions/8c15ad6a-f326-4fa7-8947-a71c11e8c0dd/resourceGroups/cl7-eu2-amer-rg-001/providers/Microsoft.Web/serverfarms/cl7-eu2-amer-ase-001-asp