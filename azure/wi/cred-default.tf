resource "azurerm_federated_identity_credential" "default" {
  name                = "default"
  resource_group_name = "gkm"
  audience            = [var.oidc_issuer_url]
  issuer              = var.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.owner.id
  subject             = "system:serviceaccount:default:default"
}
