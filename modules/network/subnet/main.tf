resource "aws_subnet" "network_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.network_subnet.cidr_block
  availability_zone = var.network_subnet.availability_zone

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-subnet"
  }
}