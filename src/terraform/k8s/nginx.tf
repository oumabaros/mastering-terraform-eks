resource "helm_release" "ingress" {
  #name = "ingress"
  #repository = "https://charts.bitnami.com/bitnami"
  #repository       = "oci://registry-1.docker.io/bitnamicharts"
  #repository = "https://github.io"
  #chart      = "nginx-ingress-controller"
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.0" # Use the latest stable version
  timeout    = 600
  # Optional: wait for all resources to be ready
  wait             = true
  create_namespace = true
  namespace        = "ingress-nginx"

  set {
    #name  = "service.type"
    name  = "controller.service.type"
    value = "LoadBalancer"
  }
  set {
    name  = "service.annotations"
    value = "service.beta.kubernetes.io/aws-load-balancer-type: nlb"
  }

}
