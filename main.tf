locals {
  deploy_date = formatdate("YYYY-MM-DD", timestamp())
  ssh_key_ids = var.existing_ssh_key != "" ? [data.ibm_compute_ssh_key.existing[0].id, ibm_compute_ssh_key.project.id] : [ibm_compute_ssh_key.project.id]
  # Tags will be applied to all resources that support them.
  tags = [
    "datacenter:${var.datacenter}",
    "project:${var.project}",
    "workspace:${terraform.workspace}",
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
  tags       = local.tags
}

module "virtual-machines" {
  depends_on   = [module.vlans]
  source       = "./modules/compute-virtual"
  count        = 1
  name         = "${var.project}-virtual-instance"
  datacenter   = var.datacenter
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan.id
  private_vlan = module.vlans.private_compute_vlan.id
  local_disk   = true
  ssh_key_ids  = local.ssh_key_ids
  tags         = local.tags
}

module "ticket" {
  depends_on      = [module.virtual-machines]
  source          = "./modules/ticket"
  private_vlan_id = module.vlans.private_compute_vlan.id
  vsi_private_ip  = module.virtual-machines[0].instance_private_ip
  datacenter   = var.datacenter
}

module "gateway-appliances" {
  depends_on   = [module.virtual-machines]
  source       = "./modules/gateway-appliance"
  datacenter   = var.datacenter
  gateway_name = "${var.project}-gateway"
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan.id
  private_vlan = module.vlans.private_compute_vlan.id
  tags         = local.tags
}

# Setting to 1 for testing, so I don't have to wait for 4 hosts to provision.
# Set to `var.host_count` when done and validated.
module "bare-metal-hosts" {
  depends_on   = [module.gateway-appliances]
  count        = var.host_count
  source       = "./modules/compute-bare-metal"
  name         = "${var.project}-vmware-host-${count.index}"
  datacenter   = var.datacenter
  domain_name  = var.domain_name
  public_vlan  = module.vlans.public_compute_vlan.id
  private_vlan = module.vlans.private_compute_vlan.id
  tags         = local.tags
}
