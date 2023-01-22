resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_hostnames = true

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-vpc"
  }
}