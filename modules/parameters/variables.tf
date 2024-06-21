variable "name" {
  description = "Network name. This is usually the name of your VPC"
  type        = string
}

variable "prefix" {
  description = "Prefix from which to store and retrieve parameters"
  type        = string
  default     = "/network"
}

variable "vpc_id" {
  description = "ID of the VPC for this network"
  type        = string
  default     = null
}

variable "azs" {
  description = "Availability zones for this network. ex. [\"us-west-2a\", \"us-west-2b\"]"
  type        = list(string)
  default     = null
}

variable "public_subnet_ids" {
  description = "Public subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "private_subnet_ids" {
  description = "Private subnets IDs in this network"
  type        = list(string)
  default     = null
}

variable "intra_subnet_ids" {
  description = "Intra subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "redshift_subnet_ids" {
  description = "Redshift subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "database_subnet_ids" {
  description = "Database subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "elasticache_subnet_ids" {
  description = "Elasticache subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "outpost_subnet_ids" {
  description = "Output subnet IDs in this network"
  type        = list(string)
  default     = null
}

variable "public_alb_arns" {
  description = "Public ALB ARNs in this network"
  type        = list(string)
  default     = null
}

variable "private_alb_arns" {
  description = "Private ALB ARNs in this network"
  type        = list(string)
  default     = null
}

variable "public_alb_certificate_arns" {
  description = "Certificate ARNs on public ALBs in this network"
  type        = list(string)
  default     = null
}

variable "private_alb_certificate_arns" {
  description = "Certificate ARNs on private ALBs in this network"
  type        = list(string)
  default     = null
}

variable "alt_public_alb_arns" {
  description = "Alternative public ALB ARNs in this network"
  type        = list(string)
  default     = null
}

variable "alt_private_alb_arns" {
  description = "Alternative private ALB ARNs in this network"
  type        = list(string)
  default     = null
}

variable "alt_public_alb_certificate_arns" {
  description = "Certificate ARNs on alternative public ALBs in this network"
  type        = list(string)
  default     = null
}

variable "alt_private_alb_certificate_arns" {
  description = "Certificate ARNs on alternative private ALBs in this network"
  type        = list(string)
  default     = null
}

variable "public_certificate_arn" {
  description = "Default public ACM certificate ARN for this network"
  type        = string
  default     = null
}

variable "private_certificate_arn" {
  description = "Default private ACM certificate ARN for this network"
  type        = string
  default     = null
}

variable "cloudfront_certificate_arn" {
  description = "Default public certificate ARN to be used for CloudFront"
  type        = string
  default     = null
}

variable "public_zone_name" {
  description = "Default public route53 zone name for this network"
  type        = string
  default     = null
}

variable "private_zone_name" {
  description = "Default private route53 zone name for this network"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources created by this module"
  type        = map(string)
  default     = {}
}

variable "suppress_tagging" {
  description = "Set this to true to suppress built-in tags from being added to resources."
  type        = bool
  default     = false
}

variable "create" {
  description = "Set to false to disable creation of resources in this module."
  type        = bool
  default     = true
}
