resource "ibm_network_vlan" "public" {
  name       = "${var.vlan_name}-public"
  datacenter = var.datacenter
  type       = "PUBLIC"
  #   router_hostname = "fcr01a.dal06"
  tags = var.tags
}

resource "ibm_network_vlan" "private" {
  name       = "${var.vlan_name}-private"
  datacenter = var.datacenter
  type       = "PRIVATE"
  #   router_hostname = "fcr01a.dal06"
  tags = var.tags
}