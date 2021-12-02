data "digitalocean_kubernetes_cluster" "do_k8s_challenge_2021" {
  name       = "do-k8s-challenge-2021"
  depends_on = [digitalocean_kubernetes_cluster.do_k8s_challenge_2021]
}

output "cluster_host" {
  value = data.digitalocean_kubernetes_cluster.do_k8s_challenge_2021.endpoint
}

output "cluster_token" {
  value = data.digitalocean_kubernetes_cluster.do_k8s_challenge_2021.kube_config[0].token
}

output "cluster_ca_certificate" {
  value = base64decode(
    data.digitalocean_kubernetes_cluster.do_k8s_challenge_2021.kube_config[0].cluster_ca_certificate
  )
}