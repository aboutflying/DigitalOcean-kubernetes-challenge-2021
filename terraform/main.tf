module "do" {
  source = "./modules/do"

  project_name        = var.project_name
  project_description = var.project_description

  cluster_name   = var.cluster_name
  cluster_region = var.cluster_region

  node_pool_name = var.node_pool_name
  node_size      = var.node_size
  node_count     = var.node_count
}

module "k8s-config" {
  source = "./modules/k8s-config"

  cluster_host           = module.do.cluster_host
  cluster_token          = module.do.cluster_token
  cluster_ca_certificate = module.do.cluster_ca_certificate

  argo_url                                   = var.argo_url
  argo_applicationset_controller_manifest_url = var.argo_applicationset_controller_manifest_url
}
