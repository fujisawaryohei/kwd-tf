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
          protocol    = "TCP"
          to_port     = 80
        },
        {
          cidr_blocks = [ "0.0.0.0/0" ]
          from_port   = 22
          protocol    = "TCP"
          to_port     = 22
        }
      ]
    }
    egress_rules = {
      type = "egress"
      rules = [ 
        {
          cidr_blocks = [ "0.0.0.0/0" ]
          from_port   = -1
          to_port     = -1
          protocol    = "0"
        } 
      ]
    }
  }
}

variable "ec2" {
  type = map(any)

  default = {
    ami_id          = "ami-02c3627b04781eada"
    instance_type   = "t3.micro"
    ebs_volume_size = 150
  }
}