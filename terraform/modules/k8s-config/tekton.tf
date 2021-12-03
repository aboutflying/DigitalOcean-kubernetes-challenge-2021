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