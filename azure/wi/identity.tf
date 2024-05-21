resource "azurerm_user_assigned_identity" "owner" {
  name                = "owner"
  location            = "polandcentral"
  resource_group_name = "gkm"
}

resource "azurerm_role_assignment" "owner" {
  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Owner"
  principal_id         = azurerm_user_assigned_identity.owner.principal_id
}


