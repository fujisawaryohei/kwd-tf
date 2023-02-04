# Common
variable "common" {
  type = map(any)
  default = {
    env      = "dev"
    app_name = "inspection"
  }
}

# Network
variable "vpc" {
  type = map(any)
  default = {
    cidr_block = "10.0.0.0/16"
  }
}

variable "inspection_subnet" {
  type = map(any)
  default = {
    name              = "inspection_subnet"
    cidr_block        = "10.0.0.0/24"
    availability_zone = "ap-northeast-1a"
  }
}

variable "inspection_subnet_rtb" {
  type = map(any)
  default = {
    to_igw_addresses = ["0.0.0.0/0"]
  }
}

variable "ec2-sg" {
  type = object({
    ingress_rules = object({
      type  = string
      rules = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
      }))
    })
    egress_rules = object({
      type  = string
      rules = list(object({
        from_port   = number
        to_port     = number
        protocol    = string
        cidr_blocks = list(string)
      }))
    })
  })

  default = {
    ingress_rules = {
      type = "ingress"
      rules = [ 
        {
          cidr_blocks = [ "0.0.0.0/0" ]
          from_port   = 80          
          to_port     = 80
          protocol    = "TCP"
        },
        {
          cidr_blocks = [ "0.0.0.0/0" ]
          from_port   = 22
          to_port     = 22
          protocol    = "TCP"
        }
      ]
    }
    egress_rules = {
      type = "egress"
      rules = [ 
        {
          cidr_blocks = [ "0.0.0.0/0" ]
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
        } 
      ]
    }
  }
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

  default = {
    ami_id          = "ami-02c3627b04781eada"
    instance_type   = "t3.micro"
    root_volume = {
      device_name = "/dev/sda1"
      volume_size = 100
      encrypted = false
      delete_on_terminate = false
    }
    second_volume = {
      device_name = "/dev/sdf1"
      volume_size = 100
      encrypted = false
      delete_on_terminate = false
    }
  }
}