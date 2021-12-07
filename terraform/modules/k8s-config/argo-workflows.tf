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
    name  = "controller.workflowNamespaces"
    value = "argo"
  }

  atomic = true

  depends_on = [kubernetes_namespace.argo]
}

resource "kubernetes_manifest" "applicationset_argo_workflows" {
  manifest = {
    "apiVersion" = "argoproj.io/v1alpha1"
    "kind"       = "ApplicationSet"
    "metadata" = {
      "name"      = "argo-workflows"
      "namespace" = "argocd"
    }
    "spec" = {
      "generators" = [
        {
          "list" = {
            "elements" = [
              {
                "cluster" = "in-cluster"
                "url"     = "https://kubernetes.default.svc"
              },
            ]
          }
        },
      ]
      "template" = {
        "metadata" = {
          "name" = "argo-workflows"
        }
        "spec" = {
          "destination" = {
            "namespace" = "argo"
            "server"    = "{{url}}"
          }
          "project" = "default"
          "source" = {
            "path"           = "workflows"
            "repoURL"        = var.argo_repo_url
            "targetRevision" = "HEAD"
            "directory" = {
              "recurse" = "true"
            }
          }
          "syncPolicy" = {
            "automated" = {
              "prune" = "false"
            }
          }
        }
      }
    }
  }
}