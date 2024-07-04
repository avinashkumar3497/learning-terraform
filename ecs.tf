# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
resource "aws_launch_template" "foobar" {   #required to create ASG
  name_prefix   = "foobar"
  image_id      = "ami-03a4566c745ed2654" #copied from other ASG which was already existing
  instance_type = "t2.micro"
  tags = {
    Terraform = "true"
  }
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group
resource "aws_autoscaling_group" "bar" { # required to create capacity provider
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1
  protect_from_scale_in = true #this attributr is needed if you want to enable managed_termination_protection in capacity provider.
  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
    tag {
    key                 = "AmazonECSManaged"
    value               = true
    propagate_at_launch = true
  }
   tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
}
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_capacity_provider
resource "aws_ecs_capacity_provider" "test" { # required to create ecs-cluster
  name = "test"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.bar.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 10
    }
  }
}

resource "aws_ecs_cluster" "foo" {
  name = "white-hart"
  tags = {
    Terraform = "true"
  }
}