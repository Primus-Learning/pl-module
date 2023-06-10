locals {

 common_tags ={
    Env = var.vpc_name
    Team = var.environment
 }

 pl_suffix="${local.common_tags["Env"]}-${${local.common_tags["Team"]}}"

 security_group_name= "${local.pl_suffix}-sg"
 luanch_template="${local.pl_suffix}-lp"
 load_balancer_name = "${local.pl_suffix}-alb"

}