resource "aws_instance" "ec2" {
  ami                     = var.ec2.ami_id
  instance_type           = var.ec2.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = var.sg_ids
  disable_api_termination = true
  key_name                = aws_key_pair.ec2_key.id
  
  # root volume
  ebs_block_device {
    device_name = var.ec2.root_volume.device_name
    volume_size = var.ec2.root_volume.volume_size
    encrypted = var.ec2.root_volume.encrypted
    delete_on_termination = var.ec2.root_volume.delete_on_terminate
  }

  # second volume
  ebs_block_device {
    device_name = var.ec2.second_volume.device_name
    volume_size = var.ec2.second_volume.volume_size
    encrypted = var.ec2.second_volume.encrypted
    delete_on_termination = var.ec2.second_volume.delete_on_terminate
  }

  lifecycle {
    ignore_changes = [
      ebs_block_device,
      subnet_id
    ]
  }

  tags = {
    Name: "${var.common.app_name}-${var.common.env}-ec2"
  }
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = file(var.pub_key_path)
}