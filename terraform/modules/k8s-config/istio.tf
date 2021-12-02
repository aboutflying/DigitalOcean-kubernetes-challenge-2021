# https://istio.io/latest/docs/setup/install/helm/

resource "kubernetes_namespace" "istio_system" {
  metadata {
    name = "istio-system"
  }
}

locals {
  istio_chart_repo = "https://istio-release.storage.googleapis.com/charts"
}

resource "kubernetes_namespace" "istio_ingress" {
  metadata {
    name = "istio-ingress"

    labels = {
      istio-injection = "enabled"
    }
  }
}

resource "helm_release" "istio_base" {
  name      = "istio-base"
  namespace = "istio-system"

  repository = local.istio_chart_repo
  chart      = "base"
  version    = var.istio_version

  depends_on = [kubernetes_namespace.istio_system]
}

resource "helm_release" "istiod" {
  name      = "istiod"
  namespace = "istio-system"

  repository = local.istio_chart_repo
  chart      = "istiod"
  version    = var.istio_version

  atomic = true

  depends_on = [helm_release.istio_base]
}

resource "helm_release" "istio_ingress" {
  name      = "istio-ingress"
  namespace = "istio-ingress"

  repository = local.istio_chart_repo
  chart      = "gateway"
  version    = var.istio_version

  atomic = true

  depends_on = [helm_release.istiod, kubernetes_namespace.istio_ingress]
}
