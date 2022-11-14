ouput "public_compute_vlan" {
  value = ibm_network_vlan.public.id
}

ouput "private_compute_vlan" {
  value = ibm_network_vlan.private.id
}