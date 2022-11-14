resource "ibm_compute_bare_metal" "host" {
  # Mandatory fields
  package_key_name = "DUAL_E52600_V4_12_DRIVES"
  process_key_name = "INTEL_INTEL_XEON_E52620_V4_2_10"
  memory           = 64
  os_key_name      = "OS_NO_OPERATING_SYSTEM"
  hostname         = var.name
  domain           = var.domain_name
  datacenter       = var.datacenter
  network_speed    = var.network_speed
  public_bandwidth = 2000
  disk_key_names   = ["HARD_DRIVE_800GB_SSD", "HARD_DRIVE_800GB_SSD", "HARD_DRIVE_800GB_SSD"]
  hourly_billing   = false
  private_network_only = false
  unbonded_network     = true
  public_vlan_id       = var.public_vlan
  private_vlan_id      = var.private_vlan
  tags = var.tags
  redundant_power_supply = true
}