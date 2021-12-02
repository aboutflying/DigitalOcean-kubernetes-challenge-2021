resource "digitalocean_project" "do_k8s_challenge_2021" {
  name        = var.project_name
  description = var.project_description
  resources   = [digitalocean_kubernetes_cluster.do_k8s_challenge_2021.urn]
}