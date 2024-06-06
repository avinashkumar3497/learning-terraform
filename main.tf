terraform {
  cloud {
    organization = "avinashkumar3497"
    workspaces { name = "example-workspace" }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "demo_server" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld3"
  }
}