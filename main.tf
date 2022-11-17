locals {
  deploy_date = formatdate("YYYY-MM-DD", timestamp())
  ssh_key_ids = var.existing_ssh_key != "" ? [data.ibm_compute_ssh_key.existing[0].id, ibm_compute_ssh_key.project.id] : [ibm_compute_ssh_key.project.id]
  # Tags will be applied to all resources that support them.
  tags = [
    "datacenter:${var.datacenter}",
    "project:${var.project}",
    "workspace:${terraform.workspace}",
    "deployed:${local.deploy_date}",
    "provider:ibm"
  ]
}

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "ibm_compute_ssh_key" "project" {
  label      = "${var.project}-sshkey"
  public_key = tls_private_key.ssh.public_key_openssh
  tags       = local.tags
}

module "vlans" {
  source     = "./modules/vlans"
  datacenter = var.datacenter
  vlan_name  = "${var.project}-vlan"
  tags       = local.tags
}

module "gateway-appliances" {
  source       = "./modules/gateway-appliance"
  datacenter   = var.datacenter
  gateway_name = "${var.project}-gateway"
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan
  private_vlan = module.vlans.private_compute_vlan
  tags         = local.tags
}

module "bare-metal-hosts" {
  count        = var.host_count
  source       = "./modules/compute-bare-metal"
  name         = "${var.project}-vmware-host-${count.index}"
  datacenter   = var.datacenter
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan
  private_vlan = module.vlans.private_compute_vlan
  tags         = local.tags
}

module "virtual-machines" {
  source       = "./modules/compute-virtual"
  count        = 1
  name         = "${var.project}-virtual-instance"
  datacenter   = var.datacenter
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan
  private_vlan = module.vlans.private_compute_vlan
  local_disk   = true
  ssh_key_id   = local.ssh_key_ids
  tags         = local.tags
}