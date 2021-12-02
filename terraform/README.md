## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_do"></a> [do](#module\_do) | ./modules/do | n/a |
| <a name="module_k8s-config"></a> [k8s-config](#module\_k8s-config) | ./modules/k8s-config | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argo_applicationset_controller_manifest_url"></a> [argo\_applicationset\_controller\_manifest\_url](#input\_argo\_applicationset\_controller\_manifest\_url) | URL to the Argo CD ApplicationSet Controller manifest | `string` | n/a | yes |
| <a name="input_argo_url"></a> [argo\_url](#input\_argo\_url) | Argo CD's externally facing base URL (optional) | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | A name for the Kubernetes cluster | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | The slug identifier for the region where the Kubernetes cluster will be created | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool | `number` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | A name for the node pool | `string` | n/a | yes |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool | `string` | n/a | yes |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | Description of the DO project | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the DO project | `string` | n/a | yes |

## Outputs

No outputs.
