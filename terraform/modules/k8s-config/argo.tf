resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  set {
    name  = "server.extraArgs"
    value = "{--insecure}"
  }

  set {
    name  = "server.config.users\\.anonymous\\.enabled"
    value = "true"
    type  = "string"
  }

  set {
    name  = "server.rbacConfig.policy\\.default"
    value = "role:readonly"
  }

  set {
    name  = "server.config.url"
    value = var.argo_url == "" ? "https://argocd.example.com" : var.argo_url
  }

  atomic = true

  depends_on = [kubernetes_namespace.argocd]
}

data "http" "argo_applicationset_controller_manifest" {
  url = var.argo_applicationset_controller_manifest_url
}

data "kubectl_file_documents" "docs" {
  content = data.http.argo_applicationset_controller_manifest.body
}

resource "kubectl_manifest" "argo_applicationset_controller" {
  for_each  = data.kubectl_file_documents.docs.manifests
  yaml_body = each.value

  override_namespace = "argocd"
}

# need VS and gateway