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
  type = string
}
variable "az_count" {
  type = number
}
variable "node_image_type" {
  type = string
}
variable "node_size" {
  type = string
}
variable "admin_users" {
  type    = list(string)
  default = ["markti"]
}
variable "k8s_namespace" {
  type = string
}
variable "k8s_service_account_name" {
  type = string
}
