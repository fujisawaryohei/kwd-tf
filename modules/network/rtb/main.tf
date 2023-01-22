resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-rtb"
  }
}

resource "aws_route" "rtb_route" {
  for_each               = toset(var.rtb.to_igw_addresses)
  route_table_id         = aws_route_table.rtb.id
  destination_cidr_block = each.value
  gateway_id             = var.igw_id
}

resource "aws_route_table_association" "public_rtb_association" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rtb.id
}