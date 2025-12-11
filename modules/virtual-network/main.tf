# Azure Virtual Network Module
# Author: Dipak Suryawanshi
# Purpose: Create production-ready VNet with subnets

terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  
  tags = merge(
    var.tags,
    {
      ManagedBy = "Terraform"
      Module    = "virtual-network"
      CreatedBy = "Dipak Suryawanshi"
    }
  )
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnets
  
  name                 = "${var.vnet_name}-subnet-${each.key}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

# DNS Configuration
resource "azurerm_virtual_network_dns_servers" "dns" {
  count              = length(var.dns_servers) > 0 ? 1 : 0
  virtual_network_id = azurerm_virtual_network.vnet.id
  dns_servers        = var.dns_servers
}
