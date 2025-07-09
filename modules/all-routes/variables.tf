variable "cidr_blocks" {
  type = list(string)
}

variable "route_table_ids" {
  type = list(string)
}

variable "gateway_id" {
  type = list(string)
  default = []
}

variable "transit_gateway_id" {
  type = list(string)
  default = []
}

variable "nat_gateway_id" {
  type = list(string)
  default = []
}

variable "vpc_endpoint_id" {
  type = list(string)
  default = []
}
