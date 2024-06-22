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

resource "aws_elastic_beanstalk_environment" "tfenvtest-demo" {
  name                = "tf-test-name-demo"
  application         = aws_elastic_beanstalk_application.tftest.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.6 running Node.js 20"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-instance-profile"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "avinash-aws"
  }  
}
resource "aws_instance" "demo_server" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
#resource "<provider>_<resource_type>" "name" {
# config options...
# key = "value" 
# key2 = "another value"
#}