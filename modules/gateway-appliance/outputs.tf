output "public_transit_vlan" {
  value = ibm_network_gateway.gateway.public_vlan_id
}

output "private_transit_vlan" {
  value = ibm_network_gateway.gateway.private_vlan_id
}

output "gateway_public_ip" {
  value = ibm_network_gateway.gateway.public_ipv4_address
}