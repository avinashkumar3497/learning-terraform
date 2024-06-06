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

resource "aws_instance" "demo_server" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld1"
  }
}