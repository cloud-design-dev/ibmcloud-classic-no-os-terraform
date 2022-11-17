output "bare_metal_hosts" {
  value = module.bare-metal-hosts[*].host_info
}

output "bare_metal_host_ids" {
  value = module.bare-metal-hosts[*].host_id
}

output "bare_metal_host_public_ips" {
  value = module.bare-metal-hosts[*].host_public_ipv4_address
}

output "bare_metal_host_private_ips" {
  value = module.bare-metal-hosts[*].host_private_ipv4_address
}

output "virtual_machine" {
  value = module.virtual-machines[0].instance
}