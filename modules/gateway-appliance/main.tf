resource "ibm_network_gateway" "gateway" {
  name = var.gateway_name

  members {
    hostname             = "${var.gateway_name}-1"
    domain               = var.domain_name
    datacenter           = var.datacenter
    network_speed        = var.network_speed
    private_network_only = false
    tcp_monitoring       = true
    process_key_name     = "INTEL_XEON_5218_2_30"
    os_key_name          = "OS_VIRTUAL_ROUTER_APPLIANCE_20_X_UP_TO_20_GBPS_SUBSCRIPTION_EDITION_64_BIT"
    package_key_name     = "VIRTUAL_ROUTER_APPLIANCE_10_GPBS"
    redundant_network    = false
    disk_key_names       = ["HARD_DRIVE_2_00_TB_SATA_2"]
    public_bandwidth     = 20000
    memory               = 32
    public_vlan_id       = var.public_vlan
    private_vlan_id      = var.private_vlan
    tags                 = var.tags
    ipv6_enabled         = true
  }
  members {
    hostname             = "${var.gateway_name}-2"
    domain               = var.domain_name
    datacenter           = var.datacenter
    network_speed        = var.network_speed
    private_network_only = false
    tcp_monitoring       = true
    process_key_name     = "INTEL_XEON_5218_2_30"
    os_key_name          = "OS_VIRTUAL_ROUTER_APPLIANCE_20_X_UP_TO_20_GBPS_SUBSCRIPTION_EDITION_64_BIT"
    package_key_name     = "VIRTUAL_ROUTER_APPLIANCE_10_GPBS"
    redundant_network    = false
    disk_key_names       = ["HARD_DRIVE_2_00_TB_SATA_2"]
    public_bandwidth     = 20000
    memory               = 32
    public_vlan_id       = var.public_vlan
    private_vlan_id      = var.private_vlan
    tags                 = var.tags
    ipv6_enabled         = true
  }
}
