locals {
  profile        = "fusic_dev"
  region         = "ap-northeast-1"
  provisioned_by = "terraform"
}

provider "aws" {
  profile = local.profile
  region  = local.region
  default_tags {
    tags = {
      ProvisionedBy = local.provisioned_by
    }
  }
}