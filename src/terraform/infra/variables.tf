variable "application_name" {
  type    = string
  default = "fleet-portal"
}
variable "environment_name" {
  type    = string
  default = "dev"
}
variable "primary_region" {
  type    = string
  default = "us-east-1"
}
variable "ecr_image_pushers" {
  type    = list(string)
  default = ["Terraform"]
}
variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/21"
}
variable "az_count" {
  type    = number
  default = 3
}
variable "node_image_type" {
  type    = string
  default = "AL2_x86_64"
}
variable "node_size" {
  type    = string
  default = "t3.medium"
}
variable "admin_users" {
  type    = list(string)
  default = ["markti"]
}
variable "k8s_namespace" {
  type    = string
  default = "app"
}
variable "k8s_service_account_name" {
  type    = string
  default = "fleet-portal"
}
