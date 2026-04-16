# Resource Group
resource "azurerm_resource_group" "rg1" {
  name     = var.azure-rg-1
  location = var.loc1
}

# VNET
resource "azurerm_virtual_network" "region1-vnet1-hub1" {
  name                = var.region1-vnet1-name
  location            = var.loc1
  resource_group_name = azurerm_resource_group.rg1.name
  address_space       = [var.region1-vnet1-address-space]
}

# ASWA
resource "azurerm_static_web_app" "nonzaint-aswa1" {
  name                = var.nonzaint-aswa1
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.loc1

  sku_size = "Free"
  sku_tier = "Free"
}

output "deployment_token" {
  value       = azurerm_static_web_app.nonzaint-aswa1.api_key
  sensitive   = true
  description = "Copy this value into your GitHub Secrets"
}