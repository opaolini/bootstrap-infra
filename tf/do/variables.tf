# Cluster Variables
#
variable "cluster_name" {
  type    = "string"
  default = "test"
}

variable "k8s_version" {
  type    = "string"
  default = "1.14.2-do.0"
}

variable "do_region" {
  type    = "string"
  default = "test"
}

variable "regions" {
  type = "map"

  default = {
    "nyc"       = "nyc1"
    "sanfran"   = "sfo1"
    "singapore" = "sgp1"
  }
}

variable "cluster_tags" {
  type    = "list"
  default = ["test"]
}

# Node Pool Variables
#

variable "node_pool_name" {
  type    = "string"
  default = "test_node_pool"
}

variable "node_pool_count" {
  type    = "number"
  default = 3
}

variable "node_size" {
  type    = "string"
  default = "s-2vcpu-2gb"
}
