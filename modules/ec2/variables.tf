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

variable "key_name" {
  type = string
}

variable "pub_key_path" {
  type = string
}