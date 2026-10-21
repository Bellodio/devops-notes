terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {	
	
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "webserver" {
  image = docker_image.nginx.image_id
  name  = "terraform-nginx-test"
  
  ports {
    internal = 80   # porta nginx

    external = 8080 # porta PC
  }
}
