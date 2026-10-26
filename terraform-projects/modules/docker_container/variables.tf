variable "container_name" {
  type        = string
  description = "Il nome da assegnare al container"
}

variable "external_port" {
  type        = number
  description = "La porta esterna esposta sull'Host"
}

variable "backend_url" {
  type        = string
  description = "URL del backend di riferimento (opzionale)"
  default     = ""
}
