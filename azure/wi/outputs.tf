output "annotation" {
  value = "azure.workload.identity/client-id: ${azurerm_user_assigned_identity.owner.client_id}"
}

output "login_with_default_sa_token" {
  value = "az login --service-principal --tenant ${data.azurerm_client_config.current.tenant_id} --username ${azurerm_user_assigned_identity.owner.client_id} --federated-token $(cat /run/secrets/kubernetes.io/serviceaccount/token)"
}

output "login_with_projected_sa_token" {
  value = "az login --service-principal --tenant ${data.azurerm_client_config.current.tenant_id} --username ${azurerm_user_assigned_identity.owner.client_id} --federated-token $(cat /service-account/token)"
}

output "login_with_workload_identity" {
  value = "az login --service-principal -u $AZURE_CLIENT_ID -t $AZURE_TENANT_ID --federated-token $(cat $AZURE_FEDERATED_TOKEN_FILE)"
}
