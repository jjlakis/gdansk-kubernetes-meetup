dependency "cluster" {
  config_path = "../cluster"
}

inputs = {
  oidc_issuer_url = dependency.cluster.outputs.oidc_issuer_url
}
