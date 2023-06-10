resource "aws_launch_template" "pl_ltp" {
  name = local.luanch_template
  image_id = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  key_name = "jenkins-kp"
  vpc_security_group_ids = ["${module.security-group.security_group_id}"]
  tag_specifications {
    resource_type = "instance"

    tags = {
    name = local.common_tags["Env"]
    Environment = local.common_tags["Team"]
    }
  }

  user_data = filebase64("${path.module}/nexus.sh")
}