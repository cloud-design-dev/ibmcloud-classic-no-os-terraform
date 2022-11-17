resource "ibm_network_vlan" "public" {
  name       = "${var.datacenter}-public"
  datacenter = var.datacenter
  type       = "PUBLIC"
  tags       = var.tags
}

resource "ibm_network_vlan" "private" {
  name       = "${var.datacenter}-private"
  datacenter = var.datacenter
  type       = "PRIVATE"
  #   router_hostname = "fcr01a.dal06"
  tags = var.tags
}