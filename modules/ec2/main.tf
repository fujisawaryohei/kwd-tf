resource "aws_instance" "ec2" {
  ami                     = var.ec2.ami_id
  instance_type           = var.ec2.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = var.sg_ids
  disable_api_termination = true
  key_name                = aws_key_pair.ec2_key.id
  
  root_block_device {
    volume_type = "gp2"
    volume_size = var.ec2.ebs_volume_size
  }

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-ec2"
  }
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = file(var.pub_key_path)
}