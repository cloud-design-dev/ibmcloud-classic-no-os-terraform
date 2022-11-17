output "host_info" {
  value = ibm_compute_bare_metal.host
}

output "host_id" {
  value = ibm_compute_bare_metal.host.id
}

output "host_public_ipv4_address" {
  value = ibm_compute_bare_metal.host.public_ipv4_address
}

output "host_private_ipv4_address" {
  value = ibm_compute_bare_metal.host.private_ipv4_address
}
