terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

	# creazione più container con il ciclo count
resource "docker_container" "webserver" {
  count = 2  # Genera 2 container identici ma distinti

  image = docker_image.nginx.image_id
  
  	# count.index diventa 0 per il primo e 1 per il secondo
  name  = "webserver-${count.index}"
  
  ports {
    internal = 80
    external = 8080 + count.index  # Il primo su 8080, il secondo su 8081
  }
}
