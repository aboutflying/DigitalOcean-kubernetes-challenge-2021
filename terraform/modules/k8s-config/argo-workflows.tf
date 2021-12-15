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
    value = "{--auth-mode=client}"
  }

  set {
    name  = "controller.workflowNamespaces"
    value = "{argo}"
  }

  set {
    name  = "controller.containerRuntimeExecutor"
    value = "k8sapi"
  }

  set {
    name  = "workflow.serviceAccount.create"
    value = "true"
    type  = "string"
  }

  set {
    name  = "controller.workflowDefaults.spec.serviceAccountName"
    value = "argo-workflow"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argo]
}

resource "kubernetes_manifest" "serviceaccount_argo_workflows_webhook" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "ServiceAccount"
    "metadata" = {
      "name" = "argo-workflows-webhook"
      "namespace" = "argo"
    }
  }
}

resource "kubernetes_manifest" "role_argo_workflows_webhook" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "name" = "argo-workflows-webhook"
      "namespace" = "argo"
    }
    "rules" = [
      {
        "apiGroups" = [
          "argoproj.io",
        ]
        "resources" = [
          "workfloweventbindings",
        ]
        "verbs" = [
          "list",
        ]
      },
      {
        "apiGroups" = [
          "argoproj.io",
        ]
        "resources" = [
          "workflowtemplates",
        ]
        "verbs" = [
          "get",
        ]
      },
      {
        "apiGroups" = [
          "argoproj.io",
        ]
        "resources" = [
          "workflows",
        ]
        "verbs" = [
          "create",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_argo_argo_workflows_webhook" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "name" = "argo-workflows-webhook"
      "namespace" = "argo"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "argo-workflows-webhook"
    }
    "subjects" = [
      {
        "kind" = "ServiceAccount"
        "name" = "argo-workflows-webhook"
        "namespace" = "argo"
      },
    ]
  }
}

resource "kubernetes_manifest" "certificate_istio_ingress_argo_workflows" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "Certificate"
    "metadata" = {
      "name"      = "argo-workflows-certificate"
      "namespace" = "istio-ingress"
    }
    "spec" = {
      "dnsNames" = [
        "ci.${var.route53_dns_zone}",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-prod"
      }
      "secretName" = "argo-workflows-certificate"
    }
  }

  depends_on = [
    helm_release.istio_ingress,
    kubernetes_manifest.clusterissuer_letsencrypt_prod
  ]
}

resource "kubernetes_manifest" "virtualservice_argo_workflows" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "VirtualService"
    "metadata" = {
      "name"      = "argo-workflows"
      "namespace" = "argo"
    }
    "spec" = {
      "gateways" = [
        "argo-workflows",
      ]
      "hosts" = [
        "ci.${var.route53_dns_zone}",
      ]
      "http" = [
        {
          "route" = [
            {
              "destination" = {
                "host" = "argo-argo-workflows-server"
                "port" = {
                  "number" = 2746
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

resource "kubernetes_manifest" "gateway_argo_workflows" {
  manifest = {
    "apiVersion" = "networking.istio.io/v1alpha3"
    "kind"       = "Gateway"
    "metadata" = {
      "name"      = "argo-workflows"
      "namespace" = "argo"
    }
    "spec" = {
      "selector" = {
        "istio" = "ingress"
      }
      "servers" = [
        {
          "hosts" = [
            "ci.${var.route53_dns_zone}",
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
            "ci.${var.route53_dns_zone}",
          ]
          "port" = {
            "name"     = "https"
            "number"   = 443
            "protocol" = "HTTPS"
          }
          "tls" = {
            "credentialName" = "argo-workflows-certificate"
            "mode"           = "SIMPLE"
          }
        },
      ]
    }
  }

  depends_on = [helm_release.istio_ingress]
}

resource "kubernetes_manifest" "secret_argo_workflows_webhook_clients" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Secret"
    "metadata" = {
      "name" = "argo-workflows-webhook-clients"
      "namespace" = "argo"
    }
    "stringData" = {
      "argo-workflows-webhook" = <<-EOT
      type: github
      secret: "${var.github_webhook_secret}"
      
      EOT
    }
  }
}
