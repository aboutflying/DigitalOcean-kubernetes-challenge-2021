resource "helm_release" "cert_manager" {
  name = "cert-manager"
  namespace = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"

  set {
    name  = "installCRDs"
    value = "true"
    type  = "string"
  }

  set {
    name  = "prometheus.enabled"
    value = "false"
    type  = "string"
  }

  create_namespace = true
  atomic           = true
}