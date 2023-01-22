variable "sg" {
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
}

variable "vpc_id" {
  type = string
}