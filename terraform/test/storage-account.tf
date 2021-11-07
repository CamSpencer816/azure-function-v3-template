resource "azurerm_storage_account" "my_function" {
  name                     = "${var.service_prefix}${var.service_name_short}${var.environment}sa"
  resource_group_name      = azurerm_resource_group.my_function.name
  location                 = azurerm_resource_group.my_function.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
