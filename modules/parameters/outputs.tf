output "vpc_parameter_path" {
  value = local.vpc_path
}

output "vpc_parameter_id" {
  value = join("", aws_ssm_parameter.vpc.*.id)
}

output "vpc_parameter_arn" {
  value = join("", aws_ssm_parameter.vpc.*.arn)
}

output "azs_parameter_path" {
  value = local.azs_path
}

output "azs_parameter_ids" {
  value = aws_ssm_parameter.azs.*.id
}

output "azs_parameter_arns" {
  value = aws_ssm_parameter.azs.*.arn
}

output "public_subnets_parameter_path" {
  value = local.public_subnets_path
}

output "public_subnets_parameter_ids" {
  value = aws_ssm_parameter.public_subnets.*.id
}

output "public_subnets_parameter_arns" {
  value = aws_ssm_parameter.public_subnets.*.arn
}

output "private_subnets_parameter_path" {
  value = local.private_subnets_path
}

output "private_subnets_parameter_ids" {
  value = aws_ssm_parameter.private_subnets.*.id
}

output "private_subnets_parameter_arns" {
  value = aws_ssm_parameter.private_subnets.*.arn
}

output "private_albs_parameter_path" {
  value = local.private_albs_path
}

output "private_albs_parameter_ids" {
  value = aws_ssm_parameter.private_albs.*.id
}

output "private_albs_parameter_arns" {
  value = aws_ssm_parameter.private_albs.*.arn
}

output "public_albs_parameter_path" {
  value = local.public_albs_path
}

output "public_albs_parameter_ids" {
  value = aws_ssm_parameter.public_albs.*.id
}

output "public_albs_parameter_arns" {
  value = aws_ssm_parameter.public_albs.*.arn
}

output "vpc_id" {
  value = (var.create && var.vpc_id != null) ? var.vpc_id : local.vpc_id
}

output "azs" {
  value = (var.create && var.azs != null) ? var.azs : local.azs
}

output "public_subnet_ids" {
  value = (var.create && var.public_subnet_ids != null) ? var.public_subnet_ids : local.public_subnet_ids
}

output "private_subnet_ids" {
  value = (var.create && var.private_subnet_ids != null) ? var.private_subnet_ids : local.private_subnet_ids
}

output "intra_subnet_ids" {
  value = (var.create && var.intra_subnet_ids != null) ? var.intra_subnet_ids : local.intra_subnet_ids
}

output "redshift_subnet_ids" {
  value = (var.create && var.redshift_subnet_ids != null) ? var.redshift_subnet_ids : local.redshift_subnet_ids
}

output "database_subnet_ids" {
  value = (var.create && var.database_subnet_ids != null) ? var.database_subnet_ids : local.database_subnet_ids
}

output "elasticache_subnet_ids" {
  value = (var.create && var.elasticache_subnet_ids != null) ? var.elasticache_subnet_ids : local.elasticache_subnet_ids
}

output "outpost_subnet_ids" {
  value = (var.create && var.outpost_subnet_ids != null) ? var.outpost_subnet_ids : local.outpost_subnet_ids
}

output "public_alb_arns" {
  value = (var.create && var.public_alb_arns != null) ? var.public_alb_arns : local.public_alb_arns
}

output "private_alb_arns" {
  value = (var.create && var.private_alb_arns != null) ? var.private_alb_arns : local.private_alb_arns
}

output "public_alb_certificate_arns" {
  value = (var.create && var.public_alb_certificate_arns != null) ? var.public_alb_certificate_arns : local.public_alb_certificate_arns
}

output "private_alb_certificate_arns" {
  value = (var.create && var.private_alb_certificate_arns != null) ? var.private_alb_certificate_arns : local.private_alb_certificate_arns
}

output "alt_public_alb_arns" {
  value = (var.create && var.alt_public_alb_arns != null) ? var.alt_public_alb_arns : local.alt_public_alb_arns
}

output "alt_private_alb_arns" {
  value = (var.create && var.alt_private_alb_arns != null) ? var.alt_private_alb_arns : local.alt_private_alb_arns
}

output "alt_public_alb_certificate_arns" {
  value = (var.create && var.alt_public_alb_certificate_arns != null) ? var.alt_public_alb_certificate_arns : local.alt_public_alb_certificate_arns
}

output "alt_private_alb_certificate_arns" {
  value = (var.create && var.alt_private_alb_certificate_arns != null) ? var.alt_private_alb_certificate_arns : local.alt_private_alb_certificate_arns
}

output "public_certificate_arn" {
  value = (var.create && var.public_certificate_arn != null) ? var.public_certificate_arn : local.public_certificate_arn
}

output "private_certificate_arn" {
  value = (var.create && var.private_certificate_arn != null) ? var.private_certificate_arn : local.private_certificate_arn
}

output "cloudfront_certificate_arn" {
  value = (var.create && var.cloudfront_certificate_arn != null) ? var.cloudfront_certificate_arn : local.cloudfront_certificate_arn
}

output "public_zone_name" {
  value = (var.create && var.public_zone_name != null) ? var.public_zone_name : local.public_zone_name
}

output "private_zone_name" {
  value = (var.create && var.private_zone_name != null) ? var.private_zone_name : local.private_zone_name
}
