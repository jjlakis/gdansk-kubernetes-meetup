Demo module for Azure

### Run
```
terragrunt apply
```

### See outputs
```
terragrunt output
```

### Connect to AKS
```
az aks get-credentials -n gkm -g gkm
```

### See JSON object
```
az aks show -n gkm -g gkm -ojson
```

### Run Azure CLI pod
```
kubectl run azurecli --image=mcr.microsoft.com/azure-cli -- sleep infinity
```