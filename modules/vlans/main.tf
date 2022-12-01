resource "ibm_network_vlan" "public" {
  name       = "${var.datacenter}-public"
  datacenter = var.datacenter
  type       = "PUBLIC"
  router_hostname = "fcr01a.${var.datacenter}"
  tags       = var.tags
}

resource "ibm_network_vlan" "private" {
  name       = "${var.datacenter}-private"
  datacenter = var.datacenter
  type       = "PRIVATE"
  router_hostname = "bcr01a.${var.datacenter}"
  tags = var.tags
}
