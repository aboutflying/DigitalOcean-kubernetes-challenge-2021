resource "kubernetes_namespace" "argo" {
  metadata {
    name = "argo"
  }
}
