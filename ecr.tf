resource "aws_ecr_repository" "myapp" {
  name                 = "myapp"
  tags = {
    Terraform = "true"
  }
}