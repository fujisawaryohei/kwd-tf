variable "common" {
  type = map(any)
}

variable "ec2" {
  type = object({
    ami_id = string
    instance_type = string
    root_volume = object({
      device_name = string
      volume_size = number
      encrypted = bool
      delete_on_terminate = bool
    })
    second_volume = object({
      device_name = string
      volume_size = number
      encrypted = bool
      delete_on_terminate = bool
    })
  })
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