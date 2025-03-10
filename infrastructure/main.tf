
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
}

resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-resource-group"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "aks-cluster"

  default_node_pool {
    name                 = "default"
    vm_size              = "Standard_B2s"
    min_count            = 1
    max_count            = 3
    auto_scaling_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}