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
          "workflows",
        ]
        "verbs" = [
          "list",
          "update",
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
