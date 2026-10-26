terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# 1. Scarichiamo l'immagine di Nginx
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Definiamo una mappa che unisce il nome del container alla sua porta esterna
variable "services" {
  type = map(number)
  default = {
    "frontend" = 8090
    "api"      = 8091
    "cache"    = 8092
  }
}

# 3. Creiamo i container usando for_each sulla mappa
resource "docker_container" "services" {
  for_each = var.services

  image = docker_image.nginx.image_id
  name  = each.key # Nome del container: "frontend", "api", "cache"

  ports {
    internal = 80
    external = each.value # Porta dedicata: 8090, 8091, 8092
  }
}

# 4. Stampiamo gli URL dinamici basati sulle chiavi e valori della mappa
output "service_urls" {
  description = "URL di accesso per ogni servizio gestito con for_each"
  value       = { for k, v in docker_container.services : k => "http://localhost:${v.ports[0].external}" }
}
