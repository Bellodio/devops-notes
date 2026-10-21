# Stampiamo URL di tutti i container creati con count
output "container_urls" {
  description = "Gli URL per accedere ai web server Nginx"
  value       = [for c in docker_container.webserver : "http://localhost:${c.ports[0].external}"]
}
