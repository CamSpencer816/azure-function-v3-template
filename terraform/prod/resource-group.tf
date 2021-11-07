resource "azurerm_resource_group" "my_function" {
  name     = "${var.service_prefix}-${var.service_name}-${var.environment}-rg"
  location = var.location
}
