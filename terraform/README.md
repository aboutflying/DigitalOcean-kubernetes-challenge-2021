## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_do"></a> [do](#module\_do) | ./modules/do-config | n/a |
| <a name="module_k8s-config"></a> [k8s-config](#module\_k8s-config) | ./modules/k8s-config | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_applicationset_controller_manifest_url"></a> [argo\_applicationset\_controller\_manifest\_url](#input\_argo\_applicationset\_controller\_manifest\_url) | URL to the Argo CD ApplicationSet Controller manifest | `string` | n/a | yes |
| <a name="input_argo_repo_url"></a> [argo\_repo\_url](#input\_argo\_repo\_url) | n/a | `string` | n/a | yes |
| <a name="input_argo_url"></a> [argo\_url](#input\_argo\_url) | Argo CD's externally facing base URL (optional) | `string` | `""` | no |
| <a name="input_argo_version"></a> [argo\_version](#input\_argo\_version) | n/a | `string` | n/a | yes |
| <a name="input_certmanager_version"></a> [certmanager\_version](#input\_certmanager\_version) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | A name for the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The slug identifier for the region where the Kubernetes cluster will be created | `string` | n/a | yes |
| <a name="input_istio_version"></a> [istio\_version](#input\_istio\_version) | n/a | `string` | n/a | yes |
| <a name="input_letsencrypt_email"></a> [letsencrypt\_email](#input\_letsencrypt\_email) | n/a | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool | `number` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | A name for the node pool | `string` | n/a | yes |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool | `string` | n/a | yes |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | Description of the DO project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the DO project | `string` | n/a | yes |
| <a name="input_route53_credentials_access_key_id"></a> [route53\_credentials\_access\_key\_id](#input\_route53\_credentials\_access\_key\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_credentials_secret_access_key"></a> [route53\_credentials\_secret\_access\_key](#input\_route53\_credentials\_secret\_access\_key) | n/a | `string` | n/a | yes |
| <a name="input_route53_dns_zone"></a> [route53\_dns\_zone](#input\_route53\_dns\_zone) | n/a | `string` | n/a | yes |
| <a name="input_route53_hosted_zone_id"></a> [route53\_hosted\_zone\_id](#input\_route53\_hosted\_zone\_id) | n/a | `string` | n/a | yes |
| <a name="input_route53_region"></a> [route53\_region](#input\_route53\_region) | n/a | `string` | n/a | yes |
| <a name="input_ssh_private_key"></a> [ssh\_private\_key\_path](#input\_ssh\_private\_key\_path) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
