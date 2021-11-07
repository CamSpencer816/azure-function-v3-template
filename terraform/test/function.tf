resource "azurerm_function_app" "my_function" {
  name                       = "${var.service_prefix}-${var.service_name}-${var.environment}-func"
  location                   = azurerm_resource_group.my_function.location
  resource_group_name        = azurerm_resource_group.my_function.name
  app_service_plan_id        = azurerm_app_service_plan.my_function.id
  storage_account_name       = azurerm_storage_account.my_function.name
  storage_account_access_key = azurerm_storage_account.my_function.primary_access_key
  https_only                 = true
  version                    = "~3"

  site_config {
    always_on     = false
    ftps_state    = "Disabled"
    http2_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.my_function.instrumentation_key
    "FUNCTIONS_WORKER_RUNTIME"       = "dotnet",
  }
}
