## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.4.1 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 2.1.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 1.13.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.4.1 |
| <a name="provider_http"></a> [http](#provider\_http) | 2.1.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.13.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.7.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_base](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_ingress](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [kubectl_manifest.argo_applicationset_controller](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/resources/manifest) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_system](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [http_http.argo_applicationset_controller_manifest](https://registry.terraform.io/providers/hashicorp/http/2.1.0/docs/data-sources/http) | data source |
| [kubectl_file_documents.docs](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/data-sources/file_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_applicationset_controller_manifest_url"></a> [argo\_applicationset\_controller\_manifest\_url](#input\_argo\_applicationset\_controller\_manifest\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_url"></a> [argo\_url](#input\_argo\_url) | n/a | `string` | `""` | no |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | n/a | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
