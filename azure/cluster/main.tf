resource "azurerm_resource_group" "gkm" {
  name     = "gkm"
  location = "Poland Central"
}

resource "azurerm_kubernetes_cluster" "gkm" {
  name                = "gkm"
  location            = azurerm_resource_group.gkm.location
  resource_group_name = azurerm_resource_group.gkm.name

  dns_prefix          = "gkm"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled = true
  workload_identity_enabled = true

}


