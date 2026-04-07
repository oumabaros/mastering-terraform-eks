variable "application_name" {
  type    = string
  default = "fleet-portal"
}
variable "environment_name" {
  type    = string
  default = "dev"
}
variable "cluster_name" {
  type        = string
  description = "Provided by the GitHub Action"
  default     = "eks-fleet-portal-dev"
}
variable "primary_region" {
  type        = string
  description = "Provided by the GitHub Action"
  default     = "us-east-1"
}
variable "k8s_namespace" {
  type    = string
  default = "app"
}
variable "k8s_service_account_name" {
  type    = string
  default = "fleet-portal"
}
variable "web_app_image" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "ecr-fleet-portal-dev-frontend"
    version = "2024.05.14"
  }
}
variable "web_api_image" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "ecr-fleet-portal-dev-backend"
    version = "2024.06.6"
  }
}
variable "alb_controller_role" {
  type    = string
  default = "arn:aws:iam::000000000000:role/aws-load-balancer-controller-role"
}
variable "workload_identity_role" {
  type    = string
  default = "arn:aws:iam::000000000000:role/fleet-portal-dev-workload-identity"
}
