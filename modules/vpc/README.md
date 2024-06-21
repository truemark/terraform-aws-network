# TrueMark AWS VPC

This module wraps HashiCorp's VPC module and provides a setup that matches TrueMark's standard layout and design.


## Related Links
 - https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

Read me file for the truemark-vpc

The following are the variables needed for setup.

network = "10.100.0.0" (network address of ip subnet)<br />
subnet_cidr = "/16" (options /16, /17, /18, /19, /20)<br />
az_count = 2 or 3 (Default is 2 availability zones you can change to 3)<br />
nat_type = single_az, multi_az, or nat_instance (Default is no nat. Single_az creates a nat gateway in one of the availability zones and pushes all traffic through it. Multi_az creates a nat gateway in each availability zones. Nat_instance creates a nat ec2 instance and runs nat through that instance.)<br />
private = false or true (default is true and private subnets are created to remove private = false to remove those subnets)<br />
public = false or true (default is true and public subnets are created to remove public = false to remove those subnets)<br />
intra = false or true (default is true and intra subnets are created to remove intra = false to remove those subnets)<br />
database = false or true (default is true and database subnets are created to remove database = false to remove those subnets)<br />
elasticache = false or true (default is true and elasticache subnets are created to remove elasticache = false to remove those subnets)<br />
redshift = false or true (default is false and redshift subnets are not created add redshift = true to add those subnets)<br />
publictags = To add tags to public subnets<br />
privatetags = To add tags to private subnets<br />

Module example<br />

module "vpc" {<br />
source = "truemark/vpc/aws"<br />
version         = "0.0.3"<br />
network = "10.110.0.0"<br />
subnet_cidr = "/16"<br />
nat_type = nat_instance<br />
redshift = true<br />
privatetags = {<br />
"kubernetes.io/cluster/test-cluster" = "shared",<br />
"kubernetes.io/role/internal-elb"      = "1"<br />
}<br />
publictags = {<br />
"kubernetes.io/cluster/test-cluster" = "shared",<br />
"kubernetes.io/role/elb"             = 1<br />
intratags = {<br />
}<br />
databasetags = {<br />
}<br />
elasticachetags = {<br />
}<br />
redshifttags = {<br />
}<br />
}<br />

All examples below base off of a "x.x.0.0" subnet start

For a /16 the subnets provisioned are as follows

Private subnets = ["x.x.0.0/19", "x.x.16.0/19", "x.x.32.0/19"] (8187 hosts)<br />
Public subnets = ["x.x.196.0/22", "x.x.200.0/22", "x.x.204.0/22"] (1019 hosts)<br />
Intra subnets = ["x.x.208.0/22", "x.x.212.0/22", "x.x.216.0/22"] (1019 hosts)<br />
Database subnets = ["x.x.220.0/22", "x.x.224.0/22", "x.x.228.0/22"] (1019 hosts)<br />
Elasticache subnets = ["x.x.232.0/22", "x.x.236.0/22", "x.x.240.0/22"] (1019 hosts)<br />
Redshift subnets = ["x.x.244.0/22", "x.x.248.0/22", "x.x.252.0/22"] (1019 hosts)<br />

Open subnets = ["x.x.96.0/19", "x.x.128.0/18", "x.x.192.0/22"]

For a /17 the subnets provisioned are as follows

Private subnets = ["x.x.0.0/20", "x.x.16.0/20", "x.x.32.0/20"] (4091 hosts)<br />
Public subnets = ["x.x.68.0/22", "x.x.72.0/22", "x.x.76.0/22"] (1019 hosts)<br />
Intra subnets = ["x.x.80.0/22", "x.x.84.0/22", "x.x.88.0/22"] (1019 hosts)<br />
Database subnets = ["x.x.92.0/22", "x.x.96.0/22", "x.x.100.0/22"] (1019 hosts)<br />
Elasticache subnets = ["x.x.104.0/22", "x.x.108.0/22", "x.x.112.0/22"] (1019 hosts)<br />
Redshift subnets = ["x.x.116.0/22", "x.x.120.0/22", "x.x.124.0/22"] (1019 hosts)<br />

Open subnets = ["x.x.48.0/20", "x.x.64.0/22"]

For a /18 the subnets provisioned are as follows

Private subnets = ["x.x.0.0/21", "x.x.8.0/21", "x.x.16.0/21"] (2043 hosts)<br />
Public subnets = ["x.x.34.0/23", "x.x.36.0/23", "x.x.38.0/23"] (507 hosts)<br />
Intra subnets = ["x.x.40.0/23", "x.x.42.0/23", "x.x.44.0/23"] (507 hosts)<br />
Database subnets = ["x.x.46.0/23", "x.x.48.0/23", "x.x.50.0/23"] (507 hosts)<br />
Elasticache subnets = ["x.x.52.0/23", "x.x.54.0/23", "x.x.56.0/23"] (507 hosts)<br />
Redshift subnets = ["x.x.58.0/23", "x.x.60.0/23", "x.x.62.0/23"] (507 hosts)<br />

Open subnets = ["x.x.24.0/21", "x.x.32.0/23"]

For a /19 the subnets provisioned are as follows

Private subnets = ["x.x.0.0/22", "x.x.4.0/22", "x.x.8.0/22"] (1019 hosts)<br />
Public subnets = ["x.x.17.0/24", "x.x.18.0/24", "x.x.19.0/24"] (251 hosts)<br />
Intra subnets = ["x.x.20.0/24", "x.x.21.0/24", "x.x.22.0/24"] (251 hosts)<br />
Database subnets = ["x.x.23.0/24", "x.x.24.0/24", "x.x.25.0/24"] (251 hosts)<br />
Elasticache subnets = ["x.x.26.0/24", "x.x.27.0/24", "x.x.28.0/24"] (251 hosts)<br />
Redshift subnets = ["x.x.29.0/24", "x.x.30.0/24", "x.x.31.0/24"] (251 hosts)<br />

Open subnets = ["x.x.12.0/22", "x.x.16.0/24"]

For a /20 the subnets provisioned are as follows

Private subnets = ["x.x.0.0/24", "x.x.1.0/24", "x.x.2.0/24"] (251 hosts)<br />
Public subnets = ["x.x.8.128/25", "x.x.9.0/25", "x.x.9.128/25"] (123 hosts)<br />
Intra subnets = ["x.x.10.0/25", "x.x.10.128/25", "x.x.11.0/25"] (123 hosts)<br />
Database subnets = ["x.x.11.128/25", "x.x.12.0/25", "x.x.12.128/25"] (123 hosts)<br />
Elasticache subnets = ["x.x.13.0/25", "x.x.13.128/25", "x.x.14.0/25"] (123 hosts)<br />
Redshift subnets = ["x.x.14.128/25", "x.x.15.0/25", "x.x.15.128/25"] (123 hosts)<br />

Open subnets = ["x.x.3.0/24", "x.x.4.0/22", "x.x.8.0/25"]

If for some reason you need to override the subnets you can by doing the following

network_override = override<br />
private_newbits = 3
public_newbits =1
intra_newbits = 1
database_newbits = 1
elasticache_newbits = 1
redshift_newbits = 1
private_netnum = 0
public_netnum = 2
intra_netnum = 4
database_netnum = 6
elasticache_netnum = 8
redshift_netnum = 10

newbits = is the number of additional bits with which to extend the prefix. For example, if given a prefix ending in /16 and a newbits value of 4, the resulting subnet address will have length /20.
netnum = is a whole number representing the subnet within the cidr that is used. For example with a /24 cidr when we add newbits of 2 this gives us 4 subnets of /26. so the netnum could be 0-3 depending on which of those subnets we want to use.
