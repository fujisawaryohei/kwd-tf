resource "aws_instance" "api" {
  ami                     = var.ec2.ami_id
  instance_type           = var.ec2.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = var.sg_ids
  disable_api_termination = true
  key_name                = "${var.common.app_name}-${var.common.env}-key"
  
  root_block_device {
    volume_type = "gp2"
    volume_size = var.ec2.ebs_volume_size
  }

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-ec2"
  }
}
