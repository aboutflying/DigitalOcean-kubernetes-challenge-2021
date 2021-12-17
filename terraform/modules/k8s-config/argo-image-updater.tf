resource "helm_release" "argocd_image_updater" {
  name      = "argocd-image-updater"
  namespace = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-image-updater"
  version    = var.argocd_image_updater_version

  set {
    name  = "config.argocd.grpcWeb"
    value = "false"
    type  = "string"
  }

  set {
    name  = "config.argocd.serverAddress"
    value = "http://argo-server.argo"
  }

  set {
    name  = "config.argocd.insecure"
    value = "true"
    type  = "string"
  }

  set {
    name  = "config.argocd.plaintext"
    value = "true"
    type  = "string"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argocd]
}
