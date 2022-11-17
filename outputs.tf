output "bare_metal_hosts" {
  description = "Returns host info for all deployed bare metal servers."
  value       = module.bare-metal-hosts[*].host_info
}

output "bare_metal_host_ids" {
  description = "Returns host IDs for all deployed bare metal servers."
  value       = module.bare-metal-hosts[*].host_id
}

output "bare_metal_host_public_ips" {
  description = "Returns host Public Ips for all deployed bare metal servers."
  value       = module.bare-metal-hosts[*].host_public_ipv4_address
}

output "bare_metal_host_private_ips" {
  description = "Returns host Private Ips for all deployed bare metal servers."
  value       = module.bare-metal-hosts[*].host_private_ipv4_address
}

output "virtual_machine" {
  description = "Returns host info for all deployed virtual instance."
  value       = module.virtual-machines[0].instance
}