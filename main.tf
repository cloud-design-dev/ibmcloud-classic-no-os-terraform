module "vlans" {
    source = "./modules/vlans"
    datacenter = var.datacenter
    vlan_name = "${var.project}-vlan"
    tags = concat(var.tags, ["datacenter:${var.datacenter}"])
}

module "gateway-appliances" {
    source = "./modules/gateway-appliance"
    datacenter = var.datacenter
    gateway_name = "${var.project}-gateway"
    domain_name = var.domain_name
    public_vlan = module.vlans.public_compute_vlan
    private_vlan = module.vlans.private_compute_vlan
    tags = concat(var.tags, ["datacenter:${var.datacenter}"])
}

module "bare-metal-hosts" {
    count = var.host_count
    source = "./modules/compute-bare-metal"
    name = "${var.project}-vmware-host-${count.index}"
    datacenter = var.datacenter
    domain_name = var.domain_name
    public_vlan = module.vlans.public_compute_vlan
    private_vlan = module.vlans.private_compute_vlan
    tags = concat(var.tags, ["datacenter:${var.datacenter}"])
}

module "virtual-machines" {
    source = "./modules/compute-virtual"
    count = 1
    name = var.vm_host_name
    datacenter = var.datacenter
    domain_name = var.domain_name
    public_vlan = module.vlans.public_compute_vlan
    private_vlan = module.vlans.private_compute_vlan
    local_disk = true
    tags = concat(var.tags, ["datacenter:${var.datacenter}"])
}