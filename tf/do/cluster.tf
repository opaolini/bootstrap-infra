resource "digitalocean_kubernetes_cluster" "tf_cluster" {
  name    = "${var.cluster_name}"
  region  = "${var.regions["singapore"]}"
  version = "${var.k8s_version}"
  tags    = "${var.cluster_tags}"

  node_pool {
    name       = "${var.node_pool_name}"
    size       = "${var.node_size}"
    node_count = "${var.node_pool_count}"
  }
}
