terraform {
  required_version = "1.7.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
  backend "s3" {
    bucket   = "terraformstatefileak"
    key      = "terraform-state-file"
    region   = "us-east-1"
    role_arn = "arn:aws:iam::373507016913:role/EC2ACCESS1"

  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::373507016913:role/EC2ACCESS1"
    session_name = "terraformsts"
  }

}
