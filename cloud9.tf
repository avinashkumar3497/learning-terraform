# resource "aws_cloud9_environment_ec2" "DevEnv" {
#   instance_type = "t2.micro"
#   name          = "DevEnv"
#   image_id      = "amazonlinux-2023-x86_64"
#     tags = {
#     Terraform = "true"
#   }
# }

resource "aws_cloud9_environment_ec2" "DevEnv2" {
  instance_type = "t2.micro"
  name          = "DevEnv2"
  image_id      = "amazonlinux-2023-x86_64"
    tags = {
    Terraform = "true"
  }
}