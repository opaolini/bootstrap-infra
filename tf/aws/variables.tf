#
# Variables Configuration
#


# f.e. "us-west-2" or "ap-southeast-1"
variable "cluster-region" {
  default = "ap-southeast-1"
  type = "string"
}

variable "cluster-name" {
  default = "terraform-eks-demo"
  type    = "string"
}


variable "worker-node-instance" {
  default = "m4.large"
  type    = "string"
}
