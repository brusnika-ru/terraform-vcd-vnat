data "vcd_nsxt_edgegateway" "orgEdge" {
  name     = var.vcd_edge_name
}

# Создание NAT правила
resource "vcd_nsxt_nat_rule" "nat" {
  edge_gateway_id          = data.vcd_nsxt_edgegateway.orgEdge.id
  name                     = var.name
  description              = var.description
  enabled                  = var.state
  rule_type                = var.type
  external_address         = var.ext_ip != "" ? var.ext_ip : tolist(data.vcd_nsxt_edgegateway.orgEdge.subnet)[0].primary_ip
  internal_address         = var.int_ip
  dnat_external_port       = var.in_port != "" ? var.in_port : ""
  snat_destination_address = var.dst_ip != "" ? var.dst_ip : ""
  app_port_profile_id      = var.app_id != "" ? var.app_id : ""
}