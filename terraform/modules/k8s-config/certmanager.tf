# https://cert-manager.io/docs/configuration/acme/dns01/route53/

resource "helm_release" "cert_manager" {
  name      = "cert-manager"
  namespace = "cert-manager"

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.certmanager_version

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

resource "kubernetes_secret_v1" "route53_credentials_secret" {
  metadata {
    name      = "prod-route53-credentials-secret"
    namespace = "cert-manager"
  }

  data = {
    secret-access-key = var.route53_credentials_secret_access_key
  }

  depends_on = [helm_release.cert_manager]
}

resource "kubernetes_manifest" "clusterissuer_letsencrypt_prod" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind"       = "ClusterIssuer"
    "metadata" = {
      "name" = "letsencrypt-prod"
    }
    "spec" = {
      "acme" = {
        "email"          = var.letsencrypt_email
        "preferredChain" = ""
        "privateKeySecretRef" = {
          "name" = "letsencrypt-prod"
        }
        "server" = "https://acme-v02.api.letsencrypt.org/directory"
        "solvers" = [
          {
            "dns01" = {
              "route53" = {
                "accessKeyID"  = var.route53_credentials_access_key_id
                "hostedZoneID" = var.route53_hosted_zone_id
                "region"       = var.route53_region
                "secretAccessKeySecretRef" = {
                  "key"  = "secret-access-key"
                  "name" = "prod-route53-credentials-secret"
                }
              }
            }
            "selector" = {
              "dnsZones" = [
                var.route53_dns_zone,
              ]
            }
          },
        ]
      }
    }
  }

  depends_on = [helm_release.cert_manager]
}
