output "login_cmd" {
  value = "az login --identity -u ${data.azurerm_subscription.primary.id}/resourcegroups/${azurerm_resource_group.gkm.name}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${azurerm_user_assigned_identity.reader.name}"
}