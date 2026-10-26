output "container_id" {
  value       = docker_container.this.id
  description = "L'ID univoco del container creato"
}

output "url" {
  value       = "http://localhost:${var.external_port}"
  description = "L'URL di accesso al container"
}
