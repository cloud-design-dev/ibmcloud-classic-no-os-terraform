output "public_compute_vlan" {
  value = ibm_network_vlan.public
}

output "private_compute_vlan" {
  value = ibm_network_vlan.private
}
