resource "azurerm_app_service_plan" "my_function" {
  name                = "${var.service_prefix}-${var.service_name}-${var.environment}-asp"
  location            = azurerm_resource_group.my_function.location
  resource_group_name = azurerm_resource_group.my_function.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier     = "Standard"
    size     = "S1"
    capacity = "1"
  }
}
