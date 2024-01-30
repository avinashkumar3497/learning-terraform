terraform {
  cloud {
    organization = "avinashkumar3497"
    workspaces { name = "example-workspace" }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.key
  secret_key = var.secret_key
}

resource "aws_cloud9_environment_ec2" "DevEnv" {
  instance_type = "t2.micro"
  name          = "DevEnv"
  image_id      = "amazonlinux-2023-x86_64"
  automatic_stop_time_minutes = "30"
  
}