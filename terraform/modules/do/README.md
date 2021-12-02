## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_cluster.do_k8s_challenge_2021](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster) | resource |
| [digitalocean_project.do_k8s_challenge_2021](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/project) | resource |
| [digitalocean_kubernetes_cluster.do_k8s_challenge_2021](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_cluster) | data source |
| [digitalocean_kubernetes_versions.cluster_versions](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/kubernetes_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_region"></a> [cluster\_region](#input\_cluster\_region) | n/a | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Grab the latest version slug from `doctl kubernetes options versions` | `string` | `""` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | n/a | `string` | n/a | yes |
| <a name="input_node_size"></a> [node\_size](#input\_node\_size) | n/a | `string` | n/a | yes |
| <a name="input_project_description"></a> [project\_description](#input\_project\_description) | n/a | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cluster_host"></a> [cluster\_host](#output\_cluster\_host) | n/a |
| <a name="output_cluster_token"></a> [cluster\_token](#output\_cluster\_token) | n/a |
