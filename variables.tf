variable "vcd_edge_name" {
  type        = string
  description = "The name of the edge gateway"
}

variable "net_name" {
  type        = string
  description = "Network name for NAT rule"
}

variable "description" {
  type        = string
  description = "An optional description of the NAT rule"
}

variable "enabled" {
  type        = bool
  description = "Enables or disables NAT rule (default true)"
  default     = true
}

variable "logging" {
  type        = bool
  description = "Enables or disables logging NAT rule (default false)"
  default     = false
}

variable "type" {
  type        = string
  description = "One of snat, dnat"
  default     = "dnat"
}

variable "ext_ip" {
  description = "IP address, range or subnet. IP addresses to which destination addresses on inbound packets will be translated. These addresses are the IP addresses of the one or more virtual machines for which you are configuring DNAT so that they can receive traffic from the external network"
  type        = string
  default     = ""
}

variable "src_net" {
  type        = string
  description = "IP address, range or subnet. This address must be the public IP address of the edge gateway for which you are configuring the DNAT rule. In the packet being inspected, this IP address or range would be those that appear as the destination IP address of the packet. These packet destination addresses are the ones translated by this DNAT rule"
}

variable "src_port" {
  type        = string
  description = "Select the port or port range that the incoming traffic uses on the edge gateway to connect to the internal network on which the virtual machines are connected. This selection is not available when the Protocol is set to icmp or any. Default any"
  default     = ""
}

variable "dst_net" {
  type        = string
  description = "IP address, range or subnet. IP addresses to which destination addresses on inbound packets will be translated. These addresses are the IP addresses of the one or more virtual machines for which you are configuring DNAT so that they can receive traffic from the external network"
  default     = ""
}

variable "dst_port" {
  type        = string
  description = "Select the port or port range that inbound traffic is connecting to on the virtual machines on the internal network. These ports are the ones into which the DNAT rule is translating for the packets inbound to the virtual machines"
  default     = ""
}

variable "proto" {
  type        = string
  description = "Select the protocol to which the rule applies. One of tcp, udp, icmp, any"
  default     = ""
}
