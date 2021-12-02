data "digitalocean_kubernetes_versions" "cluster_versions" {}

resource "digitalocean_kubernetes_cluster" "do_k8s_challenge_2021" {
  name    = var.cluster_name
  region  = var.cluster_region
  version = var.cluster_version == "" ? data.digitalocean_kubernetes_versions.cluster_versions.latest_version : var.cluster_version

  node_pool {
    name       = var.node_pool_name
    size       = var.node_size
    node_count = var.node_count
  }
}