resource "kubernetes_namespace" "argo" {
  metadata {
    name = "argo"
  }
}

resource "helm_release" "argo" {
  name      = "argo"
  namespace = "argo"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-workflows"
  version    = var.argo_workflows_version

  set {
    name  = "server.extraArgs"
    value = "{--auth-mode=server}"
  }

  set {
    name  = "workflowNamespaces"
    value = "{argo}"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argo]
}
