# tekton pipelines

data "http" "tekton_manifest" {
  url = var.tekton_manifest_url
}

data "kubectl_file_documents" "tekton_docs" {
  content = data.http.tekton_manifest.body
}

resource "kubectl_manifest" "tekton" {
  for_each  = data.kubectl_file_documents.tekton_docs.manifests
  yaml_body = each.value
}

# tekton dashboard

data "http" "tekton_dashboard_manifest" {
  url = var.tekton_dashboard_manifest_url
}

data "kubectl_file_documents" "tekton_dashboard_docs" {
  content = data.http.tekton_dashboard_manifest.body
}

resource "kubectl_manifest" "tekton_dashboard" {
  for_each   = data.kubectl_file_documents.tekton_dashboard_docs.manifests
  yaml_body  = each.value
  depends_on = [kubectl_manifest.tekton]
}

resource "kubernetes_manifest" "certificate_tekton_dashboard_certificate" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "tekton-certificate"
      "namespace" = "istio-ingress"
    }
    "spec" = {
      "dnsNames" = [
        "tekton.${var.route53_dns_zone}",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-prod"
      }
      "secretName" = "tekton-certificate"
    }
  }

  depends_on = [
    helm_release.istio_ingress,
    kubernetes_manifest.clusterissuer_letsencrypt_prod
  ]
}

resource "kubernetes_manifest" "virtualservice_tekton" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = "tekton-dashboard"
      "namespace" = "tekton-pipelines"
    }
    "spec" = {
      "gateways" = [
        "tekton-dashboard",
      ]
      "hosts" = [
        "tekton.${var.route53_dns_zone}",
      ]
      "http" = [
        {
          "route" = [
            {
              "destination" = {
                "host" = "tekton-dashboard"
                "port" = {
                  "number" = 9097
                }
              }
            },
          ]
        },
      ]
    }
  }

  depends_on = [helm_release.istio_ingress]
}

resource "kubernetes_manifest" "gateway_tekton" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = "tekton-dashboard"
      "namespace" = "tekton-pipelines"
    }
    "spec" = {
      "selector" = {
        "istio" = "ingress"
      }
      "servers" = [
        {
          "hosts" = [
            "tekton.${var.route53_dns_zone}",
          ]
          "port" = {
            "name"     = "http"
            "number"   = 80
            "protocol" = "HTTP"
          }
          "tls" = {
            "httpsRedirect" = true
          }
        },
        {
          "hosts" = [
            "tekton.${var.route53_dns_zone}",
          ]
          "port" = {
            "name"     = "https"
            "number"   = 443
            "protocol" = "HTTPS"
          }
          "tls" = {
            "credentialName" = "tekton-certificate"
            "mode"           = "SIMPLE"
          }
        },
      ]
    }
  }

  depends_on = [helm_release.istio_ingress]
}

# tekton triggers

data "http" "tekton_triggers_release_manifest" {
  url = var.tekton_triggers_release_manifest_url
}

data "kubectl_file_documents" "tekton_triggers_release_docs" {
  content = data.http.tekton_triggers_release_manifest.body
}

resource "kubectl_manifest" "tekton_triggers_release" {
  for_each   = data.kubectl_file_documents.tekton_triggers_release_docs.manifests
  yaml_body  = each.value
  depends_on = [kubectl_manifest.tekton]
}

data "http" "tekton_triggers_interceptors_manifest" {
  url = var.tekton_triggers_interceptors_manifest_url
}

data "kubectl_file_documents" "tekton_triggers_interceptors_docs" {
  content = data.http.tekton_triggers_interceptors_manifest.body
}

resource "kubectl_manifest" "tekton_triggers_interceptors" {
  for_each   = data.kubectl_file_documents.tekton_triggers_interceptors_docs.manifests
  yaml_body  = each.value
  depends_on = [kubectl_manifest.tekton_triggers_release]
}