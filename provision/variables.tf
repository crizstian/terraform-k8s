variable "cluster_name" {}

variable "harness_account_id" {}
variable "harness_autostopping_token" {
  description = "ccm token"
}

variable "tags" {
  default = []
}
