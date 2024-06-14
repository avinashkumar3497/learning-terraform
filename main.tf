terraform {
  cloud {
    organization = "avinashkumar3497"
    workspaces { name = "example-workspace" }
  }
}

provider "aws" {
  region     = "us-east-1"
}

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "tf-test-name"
  description = "tf-test-desc"
}

# resource "aws_elastic_beanstalk_environment" "tfenvtest" {
#   name                = "tf-test-name"
#   application         = aws_elastic_beanstalk_application.tftest.name
#   solution_stack_name = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"
# }

resource "aws_cloud9_environment_ec2" "DevEnv" {
  instance_type = "t2.micro"
  name          = "DevEnv"
  image_id      = "amazonlinux-2023-x86_64"
}

resource "aws_budgets_budget" "one_dollar" {
  name         = "one_dollar"
  time_unit    = "MONTHLY"
  budget_type  = "COST"
  limit_amount = "1"
  limit_unit   = "USD"
}

resource "aws_budgets_budget" "five_dollar" {
  name         = "five_dollar"
  time_unit    = "MONTHLY"
  budget_type  = "COST"
  limit_amount = "5"
  limit_unit   = "USD"
}

resource "aws_budgets_budget" "ten_dollar" {
  name         = "ten_dollar"
  time_unit    = "MONTHLY"
  budget_type  = "COST"
  limit_amount = "10"
  limit_unit   = "USD"
}

#resource "<provider>_<resource_type>" "name" {
# config options...
# key = "value" 
# key2 = "another value"
#}