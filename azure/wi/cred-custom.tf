resource "azurerm_federated_identity_credential" "sa" {
  name                = "withsa"
  resource_group_name = "gkm"
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.owner.id
  subject             = "system:serviceaccount:default:wi"
}

