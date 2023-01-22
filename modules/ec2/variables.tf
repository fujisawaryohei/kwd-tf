variable "common" {
  type = map(any)
}

variable "ec2" {
  type = map(any)
}

variable "subnet_id" {
  type = string
}

variable "sg_ids" {
  type = list(string)
}