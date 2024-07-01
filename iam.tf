resource "aws_iam_role" "aws-elasticbeanstalk-ec2-role" {
  name = "aws-elasticbeanstalk-ec2-role"

  //it declares the trusted entity for the role.
  //While creating a role in IAM. In the review section it shows this trust policy.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sts:AssumeRole"
        ],
        "Principal" : {
          "Service" : [
            "ec2.amazonaws.com"
          ]
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  ]
}

resource "aws_iam_role" "aws-elasticbeanstalk-service-role" {
  name = "aws-elasticbeanstalk-service-role"

  //it declares the trusted entity for the role.
  //While creating a role in IAM. In the review section it shows this trust policy.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "elasticbeanstalk.amazonaws.com"
        },
        "Action" : "sts:AssumeRole",
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : "elasticbeanstalk"
          }
        }
      }
    ]
  })

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSElasticBeanstalkEnhancedHealth",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkManagedUpdatesCustomerRolePolicy"
  ]
}

resource "aws_iam_instance_profile" "aws-elasticbeanstalk-ec2-instance-profile" {
  name = "aws-elasticbeanstalk-ec2-instance-profile"
  role = aws_iam_role.aws-elasticbeanstalk-ec2-role.name
}

resource "aws_iam_instance_profile" "aws-elasticbeanstalk-ec2-instance-profile-2" {
  name = "aws-elasticbeanstalk-ec2-role"
  role = aws_iam_role.aws-elasticbeanstalk-ec2-role.name
}