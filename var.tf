variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_cidr_range" {
  type = string
  default = "10.0.0.0/16"
}

variable "public-subnets" {
  type = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}
variable "database_subnet" {
  type = list(string)
  default = ["10.0.8.0/24", "10.0.9.0/24"]
}