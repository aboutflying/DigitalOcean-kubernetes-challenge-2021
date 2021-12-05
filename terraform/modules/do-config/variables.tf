variable "do_token" {
  type      = string
  sensitive = true
}

variable "project_name" {
  type = string
}

variable "project_description" {
  type = string
}

variable "node_pool_name" {
  type = string
}

variable "node_count" {
  type = number
}

variable "node_size" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "cluster_region" {
  type = string
}

# Grab the latest version slug from `doctl kubernetes options versions`
variable "cluster_version" {
  type    = string
  default = ""
}
