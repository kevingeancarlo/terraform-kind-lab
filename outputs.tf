output "kubeconfig_path" {
  value = kind_cluster.lab.kubeconfig_path
}

output "endpoint" {
  value = kind_cluster.lab.endpoint
}

output "hello_status" {
  value = helm_release.hello.status
}
