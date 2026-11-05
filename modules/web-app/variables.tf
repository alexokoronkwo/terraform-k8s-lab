variable "app_name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "replicas" {
  type    = number
  default = 2
}

variable "image" {
  type    = string
  default = "nginx:1.27"
}
