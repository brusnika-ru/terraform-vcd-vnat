resource "vcd_nsxv_snat" "snat" {
  count = var.type == "snat" ? 1 : 0

  edge_gateway = var.vcd_edge_name
  network_type = "ext"
  network_name = var.net_name

  original_address   = var.src_net
  translated_address = var.ext_ip
}

resource "vcd_nsxv_dnat" "dnat" {
  count = var.type == "dnat" ? 1 : 0

  edge_gateway = var.vcd_edge_name
  network_type = "ext"
  network_name = var.net_name

  enabled         = var.enabled != "" ? var.enabled : true
  logging_enabled = var.logging != "" ? var.logging : false
  description     = var.description

  original_address = var.ext_ip
  original_port    = var.src_port

  translated_address = var.dst_net
  translated_port    = var.dst_port
  protocol           = var.proto != "" ? var.proto : "tcp"
}
