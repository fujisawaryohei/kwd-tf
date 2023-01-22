terraform {
  backend "s3" {
    bucket  = "kwd-terraform-bucket"
    key     = "terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "fusic_dev"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50"
    }
  }
}