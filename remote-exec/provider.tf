terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.0"
    }
  }

  backend "s3" { #if we provide backed it bydefault considers this
    bucket = "remote-exec-practice"
    key = "practice"
    dynamodb_table = "remote-exec-practice"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}