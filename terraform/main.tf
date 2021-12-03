module "do" {
  source = "./modules/do-config"

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

  istio_version = var.istio_version

  argo_version                                = var.argo_version
  argo_url                                    = var.argo_url
  argo_repo_url                               = var.argo_repo_url
  argo_applicationset_controller_manifest_url = var.argo_applicationset_controller_manifest_url

  tekton_manifest_url           = var.tekton_manifest_url
  tekton_dashboard_manifest_url = var.tekton_dashboard_manifest_url

  ssh_private_key_path = var.ssh_private_key_path

  certmanager_version = var.certmanager_version

  route53_credentials_secret_access_key = var.route53_credentials_secret_access_key
  route53_credentials_access_key_id     = var.route53_credentials_access_key_id
  route53_hosted_zone_id                = var.route53_hosted_zone_id
  route53_dns_zone                      = var.route53_dns_zone
  route53_region                        = var.route53_region

  letsencrypt_email = var.letsencrypt_email
}
