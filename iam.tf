resource "aws_iam_role" "ecsInstanceRole" {
  name = "ecsInstanceRole"

  //it declares the trusted entity for the role.
  //While creating a role in IAM. In the review section it shows this trust policy.
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]
}