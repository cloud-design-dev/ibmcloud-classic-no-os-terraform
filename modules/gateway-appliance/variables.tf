variable "gateway_name" {}
variable "datacenter" {}
variable "network_speed" {
  description = "The network speed for the gateway."
  type        = number
  default     = 10000
}
variable "public_vlan" {}
variable "private_vlan" {}
variable "domain_name" {}
variable "tags" {}