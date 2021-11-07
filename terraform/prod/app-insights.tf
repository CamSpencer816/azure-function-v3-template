resource "azurerm_application_insights" "my_function" {
  name                = "${var.service_prefix}-${var.service_name}-${var.environment}-ai"
  location            = var.location
  resource_group_name = azurerm_resource_group.my_function.name
  application_type    = "web"
}
