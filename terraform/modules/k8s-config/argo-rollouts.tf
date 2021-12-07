resource "kubernetes_namespace" "argo_rollouts" {
  metadata {
    name = "argo-rollouts"
  }
}

resource "helm_release" "argo_rollouts" {
  name      = "argo-rollouts"
  namespace = "argo-rollouts"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-rollouts"
  version    = var.argo_rollouts_version

  set {
    name  = "dashboard.enabled"
    value = "true"
    type  = "string"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argo_rollouts]
}
