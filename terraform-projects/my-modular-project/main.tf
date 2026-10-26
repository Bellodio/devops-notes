terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Modulo Backend
module "backend" {
  source = "../modules/docker_container"

  container_name = "app-backend"
  external_port  = 9000
}

# Modulo Frontend (collegato al backend)
module "frontend" {
  source = "../modules/docker_container"

  container_name = "app-frontend"
  external_port  = 9001
  backend_url    = module.backend.url
}

output "backend_access_url" {
  value = module.backend.url
}

output "frontend_access_url" {
  value = module.frontend.url
}
# Test del ruleset GitHub Actions
