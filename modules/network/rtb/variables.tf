variable "common" {
  type = map(any)
}

variable "rtb" {
  type = map(any)
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "igw_id" {
  type = string
}