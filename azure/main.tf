resource "azurerm_resource_group" "gkm" {
  name     = "gkm"
  location = "Poland Central"
}

resource "azurerm_user_assigned_identity" "reader" {
  name                = "reader"
  location            = azurerm_resource_group.gkm.location
  resource_group_name = azurerm_resource_group.gkm.name
}

resource "azurerm_role_assignment" "reader" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.reader.principal_id
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
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.reader.id]
  }
}