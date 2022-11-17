output "public_compute_vlan" {
  value = ibm_network_vlan.public.id
}

output "private_compute_vlan" {
  value = ibm_network_vlan.private.id
}
