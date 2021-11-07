###########################################################################################
# Loads the Service Principal information for the currently logged in user. This will
# use your personal information if you're logged into `az cli` and running locally. 
# This will use the DevOps Service Connection information if running on Azure DevOps
############################################################################################
data "azurerm_client_config" "current" {
}
