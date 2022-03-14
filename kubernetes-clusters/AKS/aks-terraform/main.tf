 terraform {
   required_providers {
     azurerm = {
         source = "hashicorp/azurerm"
     }
   }
 }

provider "azurerm" {
# A features block as defined below which can be used to customize the behaviour of certain Azure Provider resources.
features {}
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }
  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }
}