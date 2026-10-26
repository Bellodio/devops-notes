terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Istanziamo il primo container chiamando il modulo locale
module "web_app_one" {
  source = "../modules/docker_container"

  container_name = "app-produzione"
  external_port  = 9000
}

# Istanziamo il secondo container riutilizzando lo stesso identico modulo!
module "web_app_two" {
  source = "../modules/docker_container"

  container_name = "app-staging"
  external_port  = 9001
}

# Stampiamo gli URL sfruttando gli output restituiti dai moduli
output "production_url" {
  value = module.web_app_one.url
}

output "staging_url" {
  value = module.web_app_two.url
}
