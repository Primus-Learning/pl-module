resource "aws_autoscaling_group" "pl_asg" {
  availability_zones = ["us-east-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.pl_ltp.id
    version = "$Latest"
  }

  depends_on = {
    aws_launch_template.pl_ltp
  }
}

resource "aws_lb" "pl_alb" {
  name               = local.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = module.vpc.public_subnets

  tags = {
    name = local.common_tags["Env"]
    Environment = local.common_tags["Team"]
  }
  depends_on = {
    module.vpc
    aws_autoscaling_group.pl_asg
  }
}

# Create a new load balancer attachment
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.pl_asg.id
  elb                    = aws_lb.pl_alb.id
}