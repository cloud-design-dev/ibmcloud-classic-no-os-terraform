variable "name" {}
variable "public_vlan" {}
variable "private_vlan" {}
variable "datacenter" {}
variable "domain_name" {}
variable "tags" {}
variable "ssh_key_ids" {}
variable "local_disk" {}
## Variables with default values 
variable "network_speed" {
  description = "The network speed for the virtual instance."
  type        = number
  default     = 1000
}

variable "os_reference_code" {
  description = "The operating system reference code for the virtual server instance."
  type        = string
  default     = "REDHAT_8_64"
}