module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = local.security_group_name
  description = "Security group for backend with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules  = ["http-80-tcp","mongodb-27017-tcp","http-8081-tcp"]
  ingress_with_source_security_group_id = [
    {
        description              = "http from service two"
        rule                     = "http-9000-tcp"
        source_security_group_id = ""
    }
    ]
}