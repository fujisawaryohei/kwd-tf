# terraform.tfvars
variable "ec2_key_name" { type = string }
variable "ec2_pub_key_path" { type = string }

# NetWork Configurations
module "vpc" {
  source  = "./modules/network/vpc"
  common  = var.common
  vpc     = var.vpc
}

module "vpc_igw" {
  source     = "./modules/network/igw"
  common     = var.common
  vpc_id     = module.vpc.id
}

module "inspection_subnet" {
  source         = "./modules/network/subnet"
  common         = var.common
  vpc_id         = module.vpc.id
  network_subnet = var.inspection_subnet
}

module "inspection_subnet_rtb" {
  source    = "./modules/network/rtb"
  common    = var.common
  rtb       = var.inspection_subnet_rtb
  vpc_id    = module.vpc.id
  subnet_id = module.inspection_subnet.id
  igw_id    = module.vpc_igw.id
}

module "ec2_sg" {
  source = "./modules/network/sg"
  sg     = var.ec2-sg
  vpc_id = module.vpc.id
}

module "ec2" {
  source       = "./modules/ec2"
  common       = var.common
  ec2          = var.ec2
  subnet_id    = module.inspection_subnet.id
  sg_ids       = [module.ec2_sg.id]
  key_name     = var.ec2_key_name
  pub_key_path = var.ec2_pub_key_path
}