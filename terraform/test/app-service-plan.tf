resource "azurerm_app_service_plan" "my_function" {
  name                = "${var.service_prefix}-${var.service_name}-${var.environment}-asp"
  location            = azurerm_resource_group.my_function.location
  resource_group_name = azurerm_resource_group.my_function.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}
