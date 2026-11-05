output "service_name" {
  value = kubernetes_service.this.metadata[0].name
}

output "namespace" {
  value = kubernetes_namespace.this.metadata[0].name
}
