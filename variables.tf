variable "AWS_REGION" {
  type    = string
  default = "ap-south-1"
}

variable "AWS_ACCESS_KEY" {
  type = string
}

variable "AWS_SECRET_KEY" {
  type = string
}

variable "AWS_ALLOWED_PORTS" {
  type = list(number)
}