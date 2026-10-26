terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

resource "docker_container" "this" {
  image = "nginx:latest"
  name  = var.container_name

  ports {
     internal = 80
     external = var.external_port
  }

  env = var.backend_url != "" ? ["BACKEND_SERVICE=${var.backend_url}"] : []
}
