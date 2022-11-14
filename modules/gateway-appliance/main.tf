resource "ibm_network_gateway" "gateway" {
  name = var.gateway_name

  members {
    hostname             = "${var.gateway_name}-1"
    domain               = var.domain_name
    datacenter           = var.datacenter
    network_speed        = var.network_speed
    private_network_only = false
    tcp_monitoring       = true
    process_key_name     = "INTEL_INTEL_XEON_E52620_V4_2_10"
    os_key_name          = "OS_VYATTA_5600_5_X_UP_TO_20GBPS_SUBSCRIPTION_EDITION_64_BIT"
    package_key_name     = "2U_NETWORK_GATEWAY_APPLIANCE_1O_GBPS"
    redundant_network    = false
    disk_key_names       = ["HARD_DRIVE_2_00TB_SATA_II"]
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
    process_key_name     = "INTEL_INTEL_XEON_E52620_V4_2_10"
    os_key_name          = "OS_VYATTA_5600_5_X_UP_TO_20GBPS_SUBSCRIPTION_EDITION_64_BIT"
    package_key_name     = "2U_NETWORK_GATEWAY_APPLIANCE_1O_GBPS"
    redundant_network    = false
    disk_key_names       = ["HARD_DRIVE_2_00TB_SATA_II"]
    public_bandwidth     = 20000
    memory               = 32
    public_vlan_id       = var.public_vlan
    private_vlan_id      = var.private_vlan
    tags                 = var.tags
    ipv6_enabled         = true
  }
}