# data "aws_security_group" "cloud9_secgroup" {
#   filter {
#     name = "tag:aws:cloud9:environment"
#     values = [
#       aws_cloud9_environment_ec2.DevEnv.id
#     ]
#   }
# }

# resource "aws_security_group_rule" "tcp_8080" {
#   type              = "ingress"
#   from_port         = 8080
#   to_port           = 8080
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   ipv6_cidr_blocks  = ["::/0"]
#   security_group_id = data.aws_security_group.cloud9_secgroup.id
# }

data "aws_security_group" "cloud9_secgroup2" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [
      aws_cloud9_environment_ec2.DevEnv2.id
    ]
  }
}

resource "aws_security_group_rule" "tcp_8080_2" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = data.aws_security_group.cloud9_secgroup2.id
}