variable "project_name" {
  type        = string
  description = "The name of the DO project"
}

variable "project_description" {
  type        = string
  description = "Description of the DO project"
}

variable "cluster_name" {
  type        = string
  description = "A name for the Kubernetes cluster"
}

variable "cluster_region" {
  type        = string
  description = "The slug identifier for the region where the Kubernetes cluster will be created"
}

variable "node_pool_name" {
  type        = string
  description = "A name for the node pool"
}

variable "node_size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool"
}

variable "node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool"
}

variable "argo_url" {
  type        = string
  description = "Argo CD's externally facing base URL (optional)"
  default     = ""
}

variable "argo_applicationset_controller_manifest_url" {
  type        = string
  description = "URL to the Argo CD ApplicationSet Controller manifest"
}

variable "route53_credentials_secret_access_key" {
  type      = string
  sensitive = true
}

variable "route53_credentials_access_key_id" {
  type      = string
  sensitive = true
}

variable "route53_hosted_zone_id" {
  type = string
}

variable "route53_region" {
  type = string
}

variable "route53_dns_zone" {
  type = string
}

variable "letsencrypt_email" {
  type = string
}
