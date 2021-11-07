resource "azurerm_key_vault" "my_function" {
  name                       = "${var.service_prefix}-${var.service_name_short}-${var.environment}-kv"
  location                   = azurerm_resource_group.my_function.location
  resource_group_name        = azurerm_resource_group.my_function.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 90
  purge_protection_enabled   = false

  sku_name = "standard"
}

# Although we can set the Access Policy within the Key Vault block,
# it causes conflicts if we want to add multiple Access Policies
resource "azurerm_key_vault_access_policy" "my_function_function" {
  key_vault_id = azurerm_key_vault.my_function.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_function_app.my_function.identity.0.principal_id

  secret_permissions = [
    "Get",
    "List",
  ]
}
