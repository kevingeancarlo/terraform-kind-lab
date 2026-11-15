provider "helm" {
  kubernetes = {
    config_path = kind_cluster.lab.kubeconfig_path
  }
}

resource "helm_release" "hello" {
  name             = "hello"
  chart            = "${path.module}/charts/hello"
  namespace        = "demo"
  create_namespace = true
  wait             = true
  timeout          = 180

  set = [
    {
      name  = "replicaCount"
      value = tostring(var.replicas)
    }
  ]
}
