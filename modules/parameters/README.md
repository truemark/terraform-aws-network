# AWS Network Parameters

This module stores and retrieves network infrastructure identifiers using
AWS Systems Manager Parameter Store.

Network automation which creates network resources may use this module
to store identifiers such as the vpc ID, subnet IDs and ALB ARNs to
the parameter store for other automation and applications to use.

    module "parameters" {
      source  = "truemark/network-parameters/aws"
      version = "VERSION_HERE"
      name = module.vpc.name
      vpc_id = module.vpc.vpc_id
      azs = module.vpc.azs
      private_subnet_ids = module.vpc.private_subnets
      public_subnet_ids = module.vpc.public_subnets
      private_alb_arns = [module.private_alb1.lb_arn, module.private_alb2.lb_arn]
      public_alb_arns = [module.public_alb1.lb_arn, module.public_alb2.lb_arn]
      public_alb_certificate_arns = [module.public_alb1.certificate_arn, module.public_alb2.certificate_arn]
      public_alb_certificate_arns = [module.private_alb1.certificate_arn, module.private_alb2.certificate_arn]
    }

Other automation which needs to reference these values may use this same
module to do parameter store lookups instead of hard coding values.

    module "parameters" {
      source  = "truemark/network-parameters/aws"
      version = "VERSION_HERE"
      name = "services"
    }

    output "vpc_id" {
      value = module.parameters.vpc_id
    }
