variable "name" {
  description = "This is the name for the vpc"
  type        = string
  default     = "services"
}
variable "network" {
  description = "This is the network address of the subnet you want to use"
  type        = string
}
# TODO Spell this out so you know what it is when you read it
variable "subnet_cidr" {
  description = "This is the network cidr of the subnet you want to use"
  type        = string
}
variable "az_count" {
  description = "This is the number of availability zones to use"
  type        = number
  default     = 2
}
variable "network_override" {
  description = "This is used if you want to override the subnet settings that are built in and use your own. setting this variable to override allows you to specify networkbits to add to vpc subnet and which netnum to use. Please see the following documentation. https://developer.hashicorp.com/terraform/language/functions/cidrsubnet "
  type        = string
  default     = "standard"
}
variable "private_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the private networks"
  type        = number
  default     = null
}
variable "public_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the public networks"
  type        = number
  default     = null
}
variable "intra_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the intra networks"
  type        = number
  default     = null
}
variable "database_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the database networks"
  type        = number
  default     = null
}
variable "elasticache_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the elasticache networks"
  type        = number
  default     = null
}
variable "redshift_newbits" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the cidr to be used for the redshift networks"
  type        = number
  default     = null
}
variable "public_netnum" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the starting netnum to be used for the public networks"
  type        = number
  default     = null
}
variable "intra_netnum" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the starting netnum to be used for the intra networks"
  type        = number
  default     = null
}
variable "database_netnum" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the starting netnum to be used for the databse networks"
  type        = number
  default     = null
}
variable "elasticache_netnum" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the starting netnum to be used for the elasticache networks"
  type        = number
  default     = null
}
variable "redshift_netnum" {
  description = "This variable is needed only if you are using the network_override variable. It is used to set the starting netnum to be used for the redshift networks"
  type        = number
  default     = null
}

# TODO Likely shouldn't be a number. This should be three options, SINGLE_AZ, MULTI_AZ, POOR_PERSON_NAT, OR NONE
variable "nat_type" {
  description = "Set nat type. The options are none, single_az, multi_az, and nat_instance. Single spins up a nat gateway in one availability zone. Multi spins up a nat gateway in each availability zone. nat instance uses the module int128/nat-instance/aws to create a small nat instance."
  type        = string
  default     = "none"
}

variable "publictags" {
  description = "Add tags to public networks"
  type        = map(string)
  default     = null
}

variable "privatetags" {
  description = "Add tags to private networks"
  type        = map(string)
  default     = null
}

variable "intratags" {
  description = "Add tags to intra networks"
  type        = map(string)
  default     = null
}

variable "databasetags" {
  description = "Add tags to database networks"
  type        = map(string)
  default     = null
}

variable "elasticachetags" {
  description = "Add tags to elasticache networks"
  type        = map(string)
  default     = null
}

variable "redshifttags" {
  description = "Add tags to redshift networks"
  type        = map(string)
  default     = null
}

variable "default_network_acl_ingress" {
  description = "Add rules to default network ingress acl"
  type        = list(map(string))
  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "default_network_acl_egress" {
  description = "Add rules to default network ingress acl"
  type        = list(map(string))
  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = "-1"
      ipv6_cidr_block = "::/0"
    },
  ]
}

variable "redshift" {
  description = "Ability to add redshift networks. They are not created by default"
  type        = bool
  default     = false
}
variable "intra" {
  description = "Ability to remove intra networks. Set to false to not create."
  type        = bool
  default     = true
}
variable "database" {
  description = "Ability to remove database networks. Set to false to not create."
  type        = bool
  default     = true
}
variable "elasticache" {
  description = "Ability to remove elasticache networks. Set to false to not create."
  type        = bool
  default     = true
}
variable "private" {
  description = "Ability to remove private networks. Set to false to not create."
  type        = bool
  default     = true
}
variable "public" {
  description = "Ability to remove public networks. Set to false to not create."
  type        = bool
  default     = true
}

variable "instance_types" {
  description = "Candidates of spot instance type for the NAT instance. This is used in the mixed instances policy"
  type        = list(string)
  default     = ["t4g.nano"]
}

variable "architecture" {
  description = "Candidates of spot instance type for the NAT instance. This is used in the mixed instances policy"
  type        = list(string)
  default     = ["arm64"]
}

variable "use_spot_instance" {
  description = "Whether to use spot or on-demand EC2 instance"
  type        = bool
  default     = false
}

#endpoints

variable "create" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
  default     = null
}

variable "endpoints" {
  description = "A map of interface and/or gateway endpoints containing their properties and configurations"
  type        = any
  default     = {}
}

variable "security_group_ids" {
  description = "Default security group IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "Default subnets IDs to associate with the VPC endpoints"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to use on all resources"
  type        = map(string)
  default     = {}
}

variable "timeouts" {
  description = "Define maximum timeout for creating, updating, and deleting VPC endpoint resources"
  type        = map(string)
  default     = {}
}

variable "s3" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = true
}

variable "dynamo" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = true
}

variable "dns64" {
  description = "enable dns64 for all subnets created"
  type        = bool
  default     = false
}

variable "enable_ipv6" {
  description = "enable dns64 for all subnets created"
  type        = bool
  default     = true
}

variable "create_parameters" {
  description = "Set to false to disable creation of resources in this module."
  type        = bool
  default     = true
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "create_multiple_public_route_tables" {
  description = "Indicates whether to create a separate route table for each public subnet. Default: `false`"
  type        = bool
  default     = false
}

variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  type        = bool
  default     = false
}

variable "default_security_group_name" {
  description = "Name to be used on the default security group"
  type        = string
  default     = null
}

variable "default_security_group_ingress" {
  description = "List of maps of ingress rules to set on the default security group"
  type        = list(map(string))
  default     = []
}

variable "default_security_group_egress" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))
  default     = []
}

variable "default_security_group_tags" {
  description = "Additional tags for the default security group"
  type        = map(string)
  default     = {}
}

################################################################################
# Flow Log
################################################################################

variable "enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "vpc_flow_log_iam_role_name" {
  description = "Name to use on the VPC Flow Log IAM role created"
  type        = string
  default     = "vpc-flow-log-role"
}

variable "vpc_flow_log_iam_role_path" {
  description = "The path for the VPC Flow Log IAM Role"
  type        = string
  default     = null
}

variable "vpc_flow_log_iam_role_use_name_prefix" {
  description = "Determines whether the IAM role name (`vpc_flow_log_iam_role_name_name`) is used as a prefix"
  type        = bool
  default     = true
}


variable "vpc_flow_log_permissions_boundary" {
  description = "The ARN of the Permissions Boundary for the VPC Flow Log IAM Role"
  type        = string
  default     = null
}

variable "vpc_flow_log_iam_policy_name" {
  description = "Name of the IAM policy"
  type        = string
  default     = "vpc-flow-log-to-cloudwatch"
}

variable "vpc_flow_log_iam_policy_use_name_prefix" {
  description = "Determines whether the name of the IAM policy (`vpc_flow_log_iam_policy_name`) is used as a prefix"
  type        = bool
  default     = true
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds"
  type        = number
  default     = 600
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL"
  type        = string
  default     = "ALL"
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Can be s3, kinesis-data-firehose or cloud-watch-logs"
  type        = string
  default     = "cloud-watch-logs"
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear"
  type        = string
  default     = null
}

variable "flow_log_destination_arn" {
  description = "The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create_flow_log_cloudwatch_log_group is set to false this argument must be provided"
  type        = string
  default     = ""
}

variable "flow_log_deliver_cross_account_role" {
  description = "(Optional) ARN of the IAM role that allows Amazon EC2 to publish flow logs across accounts."
  type        = string
  default     = null
}

variable "flow_log_file_format" {
  description = "(Optional) The format for the flow log. Valid values: `plain-text`, `parquet`"
  type        = string
  default     = null
}

variable "flow_log_hive_compatible_partitions" {
  description = "(Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3"
  type        = bool
  default     = false
}

variable "flow_log_per_hour_partition" {
  description = "(Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries"
  type        = bool
  default     = false
}

variable "vpc_flow_log_tags" {
  description = "Additional tags for the VPC Flow Logs"
  type        = map(string)
  default     = {}
}

################################################################################
# Flow Log CloudWatch
################################################################################

variable "create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_cloudwatch_iam_role_conditions" {
  description = "Additional conditions of the CloudWatch role assumption policy"
  type = list(object({
    test     = string
    variable = string
    values   = list(string)
  }))
  default = []
}

variable "flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided"
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  description = "Specifies the name prefix of CloudWatch Log Group for VPC flow logs"
  type        = string
  default     = "/aws/vpc-flow-log/"
}

variable "flow_log_cloudwatch_log_group_name_suffix" {
  description = "Specifies the name suffix of CloudWatch Log Group for VPC flow logs"
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs"
  type        = number
  default     = null
}

variable "flow_log_cloudwatch_log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data for VPC flow logs"
  type        = string
  default     = null
}

variable "flow_log_cloudwatch_log_group_skip_destroy" {
  description = " Set to true if you do not wish the log group (and any logs it may contain) to be deleted at destroy time, and instead just remove the log group from the Terraform state"
  type        = bool
  default     = false
}

variable "flow_log_cloudwatch_log_group_class" {
  description = "Specified the log class of the log group. Possible values are: STANDARD or INFREQUENT_ACCESS"
  type        = string
  default     = null
}
