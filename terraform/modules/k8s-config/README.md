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
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_base](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_ingress](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [kubectl_manifest.argo_applicationset_controller](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/resources/manifest) | resource |
| [kubernetes_manifest.certificate_istio_ingress_argo_certificate](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.clusterissuer_letsencrypt_prod](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.gateway_argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.virtualservice_argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_system](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.argo_repository_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.route53_credentials_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/secret_v1) | resource |
| [http_http.argo_applicationset_controller_manifest](https://registry.terraform.io/providers/hashicorp/http/2.1.0/docs/data-sources/http) | data source |
| [kubectl_file_documents.docs](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/data-sources/file_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_applicationset_controller_manifest_url"></a> [argo\_applicationset\_controller\_manifest\_url](#input\_argo\_applicationset\_controller\_manifest\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_repo_url"></a> [argo\_repo\_url](#input\_argo\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_url"></a> [argo\_url](#input\_argo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argocd_version"></a> [argo\_version](#input\_argo\_version) | n/a | `string` | n/a | yes |
| <a name="input_certmanager_version"></a> [certmanager\_version](#input\_certmanager\_version) | n/a | `string` | n/a | yes |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | n/a | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | n/a | `string` | n/a | yes |
| <a name="input_istio_version"></a> [istio\_version](#input\_istio\_version) | n/a | `string` | n/a | yes |
| <a name="input_letsencrypt_email"></a> [letsencrypt\_email](#input\_letsencrypt\_email) | n/a | `string` | n/a | yes |
| <a name="input_route53_credentials_access_key_id"></a> [route53\_credentials\_access\_key\_id](#input\_route53\_credentials\_access\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_credentials_secret_access_key"></a> [route53\_credentials\_secret\_access\_key](#input\_route53\_credentials\_secret\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_route53_dns_zone"></a> [route53\_dns\_zone](#input\_route53\_dns\_zone) | n/a | `string` | n/a | yes |
| <a name="input_route53_hosted_zone_id"></a> [route53\_hosted\_zone\_id](#input\_route53\_hosted\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_region"></a> [route53\_region](#input\_route53\_region) | n/a | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key\_path](#input\_ssh\_private\_key\_path) | n/a | `string` | n/a | yes |

## Outputs

No outputs.

<!-- BEGIN_TF_DOCS -->
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
| [helm_release.argo](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.argo_rollouts](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.argocd](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_base](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istio_ingress](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [helm_release.istiod](https://registry.terraform.io/providers/hashicorp/helm/2.4.1/docs/resources/release) | resource |
| [kubectl_manifest.argo_applicationset_controller](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/resources/manifest) | resource |
| [kubectl_manifest.istio_prometheus](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/resources/manifest) | resource |
| [kubernetes_manifest.applicationset_argo_workflows](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.certificate_istio_ingress_argo_certificate](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.clusterissuer_letsencrypt_prod](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.gateway_argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_manifest.virtualservice_argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/manifest) | resource |
| [kubernetes_namespace.argo](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.argo_rollouts](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.argocd](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_system](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/namespace) | resource |
| [kubernetes_secret_v1.argo_repository_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/secret_v1) | resource |
| [kubernetes_secret_v1.route53_credentials_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/2.7.0/docs/resources/secret_v1) | resource |
| [http_http.argo_applicationset_controller_manifest](https://registry.terraform.io/providers/hashicorp/http/2.1.0/docs/data-sources/http) | data source |
| [http_http.istio_prometheus_manifest](https://registry.terraform.io/providers/hashicorp/http/2.1.0/docs/data-sources/http) | data source |
| [kubectl_file_documents.argo_applicationset_controller_docs](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/data-sources/file_documents) | data source |
| [kubectl_file_documents.istio_prometheus_docs](https://registry.terraform.io/providers/gavinbunney/kubectl/1.13.1/docs/data-sources/file_documents) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_applicationset_controller_manifest_url"></a> [argo\_applicationset\_controller\_manifest\_url](#input\_argo\_applicationset\_controller\_manifest\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_repo_url"></a> [argo\_repo\_url](#input\_argo\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_rollouts_version"></a> [argo\_rollouts\_version](#input\_argo\_rollouts\_version) | n/a | `string` | n/a | yes |
| <a name="input_argo_url"></a> [argo\_url](#input\_argo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_workflows_version"></a> [argo\_workflows\_version](#input\_argo\_workflows\_version) | n/a | `string` | n/a | yes |
| <a name="input_argocd_version"></a> [argocd\_version](#input\_argocd\_version) | n/a | `string` | n/a | yes |
| <a name="input_certmanager_version"></a> [certmanager\_version](#input\_certmanager\_version) | n/a | `string` | n/a | yes |
| <a name="input_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#input\_cluster\_ca\_certificate) | n/a | `string` | n/a | yes |
| <a name="input_cluster_host"></a> [cluster\_host](#input\_cluster\_host) | n/a | `string` | n/a | yes |
| <a name="input_cluster_token"></a> [cluster\_token](#input\_cluster\_token) | n/a | `string` | n/a | yes |
| <a name="input_istio_prometheus_manifest_url"></a> [istio\_prometheus\_manifest\_url](#input\_istio\_prometheus\_manifest\_url) | n/a | `string` | n/a | yes |
| <a name="input_istio_version"></a> [istio\_version](#input\_istio\_version) | n/a | `string` | n/a | yes |
| <a name="input_letsencrypt_email"></a> [letsencrypt\_email](#input\_letsencrypt\_email) | n/a | `string` | n/a | yes |
| <a name="input_route53_credentials_access_key_id"></a> [route53\_credentials\_access\_key\_id](#input\_route53\_credentials\_access\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_credentials_secret_access_key"></a> [route53\_credentials\_secret\_access\_key](#input\_route53\_credentials\_secret\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_route53_dns_zone"></a> [route53\_dns\_zone](#input\_route53\_dns\_zone) | n/a | `string` | n/a | yes |
| <a name="input_route53_hosted_zone_id"></a> [route53\_hosted\_zone\_id](#input\_route53\_hosted\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_region"></a> [route53\_region](#input\_route53\_region) | n/a | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key](#input\_ssh\_private\_key) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->