resource "aws_eip" "eip" {
  vpc = true

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = var.ec2_id
  allocation_id = aws_eip.eip.id
}