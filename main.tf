terraform {
  cloud {
    organization = "avinashkumar3497"
    workspaces { name = "example-workspace" }
  }
}

provider "aws" {
  region     = "us-east-1"
}