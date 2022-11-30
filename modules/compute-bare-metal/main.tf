resource "ibm_compute_bare_metal" "host" {
  fixed_config_preset = "1U_4210S_384GB_2X4TB_RAID_1"
  memory              = 384
  os_reference_code   = "ROCKYLINUX_8_64"
  hostname            = var.name
  domain              = var.domain_name
  datacenter          = var.datacenter
  network_speed       = var.network_speed
  hourly_billing       = true
  private_network_only = false
  tags = var.tags
}
