locals {
  routes = flatten([
    for c in var.cidr_blocks: concat(
      [
        for t in var.route_table_ids: concat(
        [
          for g in var.gateway_id: [
          {
            route_table_id = t
            cidr_block = c
            dest = g
            dest_type = "gateway_id"
          }
        ]
        ],
        [
          for tg in var.transit_gateway_id: [
          {
            route_table_id = t
            cidr_block = c
            dest = tg
            dest_type = "transit_gateway_id"
          }
        ]
        ],
        [
          for ng in var.nat_gateway_id: [
          {
            route_table_id = t
            cidr_block = c
            dest = ng
            dest_type = "nat_gateway_id"
          }
        ]
        ],
        [
          for ve in var.vpc_endpoint_id: [
          {
            route_table_id = t
            cidr_block = c
            dest = ve
            dest_type = "vpc_endpoint_id"
          }
        ]
        ]
      )
      ]
    )
  ])
}

resource "aws_route" "route" {
  count = length(local.routes)
  route_table_id         = local.routes[count.index].route_table_id
  destination_cidr_block = local.routes[count.index].cidr_block

  gateway_id              = local.routes[count.index].dest_type == "gateway_id" ? local.routes[count.index].dest : null
  transit_gateway_id      = local.routes[count.index].dest_type == "transit_gateway_id" ? local.routes[count.index].dest : null
  nat_gateway_id          = local.routes[count.index].dest_type == "nat_gateway_id" ? local.routes[count.index].dest : null
  vpc_endpoint_id         = local.routes[count.index].dest_type == "vpc_endpoint_id" ? local.routes[count.index].dest : null
  }
