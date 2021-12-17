resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"

    labels = {
      istio-injection = "enabled"
    }
  }
}

resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argocd_version

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

  set {
    name  = "server.config.admin\\.enabled"
    value = "false"
    type  = "string"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argocd]
}

data "http" "argo_applicationset_controller_manifest" {
  url = var.argo_applicationset_controller_manifest_url
}

data "kubectl_file_documents" "argo_applicationset_controller_docs" {
  content = data.http.argo_applicationset_controller_manifest.body
}

resource "kubectl_manifest" "argo_applicationset_controller" {
  for_each  = data.kubectl_file_documents.argo_applicationset_controller_docs.manifests
  yaml_body = each.value

  override_namespace = "argocd"
}

resource "kubernetes_manifest" "certificate_istio_ingress_argo_certificate" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "argo-certificate"
      "namespace" = "istio-ingress"
    }
    "spec" = {
      "dnsNames" = [
        "cd.${var.route53_dns_zone}",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-prod"
      }
      "secretName" = "argo-certificate"
    }
  }

  depends_on = [
    helm_release.istio_ingress,
    kubernetes_manifest.clusterissuer_letsencrypt_prod
  ]
}

resource "kubernetes_manifest" "virtualservice_argocd" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = "argocd"
      "namespace" = "argocd"
    }
    "spec" = {
      "gateways" = [
        "argocd",
      ]
      "hosts" = [
        "cd.${var.route53_dns_zone}",
      ]
      "http" = [
        {
          "route" = [
            {
              "destination" = {
                "host" = "argocd-server"
                "port" = {
                  "number" = 80
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

resource "kubernetes_manifest" "gateway_argocd" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = "argocd"
      "namespace" = "argocd"
    }
    "spec" = {
      "selector" = {
        "istio" = "ingress"
      }
      "servers" = [
        {
          "hosts" = [
            "cd.${var.route53_dns_zone}",
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
            "cd.${var.route53_dns_zone}",
          ]
          "port" = {
            "name"     = "https"
            "number"   = 443
            "protocol" = "HTTPS"
          }
          "tls" = {
            "credentialName" = "argo-certificate"
            "mode"           = "SIMPLE"
          }
        },
      ]
    }
  }

  depends_on = [helm_release.istio_ingress]
}

resource "kubernetes_secret_v1" "argo_repository_secret" {
  metadata {
    name      = "k8s-challenge-repo"
    namespace = "argocd"
    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    url           = var.argo_repo_url
    sshPrivateKey = var.ssh_private_key
    type          = "git"
  }

  depends_on = [helm_release.argocd]
}

resource "kubernetes_manifest" "application_argocd_applicationsets" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "Application"
    "metadata" = {
      "name"      = "applicationsets"
      "namespace" = "argocd"
    }
    "spec" = {
      "destination" = {
        "namespace" = "argo"
        "server"    = "https://kubernetes.default.svc"
      }
      "project" = "default"
      "source" = {
        "directory" = {
          "jsonnet" = {}
          "recurse" = true
        }
        "path"           = "applicationsets"
        "repoURL"        = "git@github.com:aboutflying/DigitalOcean-kubernetes-challenge-2021.git"
        "targetRevision" = "HEAD"
      }
      "syncPolicy" = {
        "automated" = {}
      }
    }
  }
}
