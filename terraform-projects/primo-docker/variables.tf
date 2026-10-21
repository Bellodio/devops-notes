variable "container_name" {
  description = "Il nome da assegnare al container Docker"
  type        = string
  default     = "terraform-nginx-custom"
}

variable "external_port" {
  description = "La porta del PC su cui esporre il web server"
  type        = number
  default     = 8080
}
