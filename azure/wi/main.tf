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

resource "azurerm_federated_identity_credential" "default" {
  name                = "default"
  resource_group_name = "gkm"
  audience            = [var.oidc_issuer_url]
  issuer              = var.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.owner.id
  subject             = "system:serviceaccount:default:default"
}

resource "azurerm_federated_identity_credential" "sa" {
  name                = "withsa"
  resource_group_name = "gkm"
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.owner.id
  subject             = "system:serviceaccount:default:wi"
}

