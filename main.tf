terraform {
  cloud {
    organization = "avinashkumar3497"
    workspaces { name = "example-workspace" }
  }
}

provider "aws" {
  region     = "us-east-1"
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