module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.private_subnet_cidr
  public_subnets  = var.public_subnet_cidr

  enable_nat_gateway = true
  enable_vpn_gateway = true
  
  tags = {
    name = local.common_tags["Env"]
    Environment = local.common_tags["Team"]
  }
}