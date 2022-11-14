variable "iaas_classic_api_key" {
  description = "The API key for the IBM Cloud Classic infrastructure service."
  type        = string
}

variable "iaas_classic_username" {
  description = "The username for the IBM Cloud Classic infrastructure service."
  type        = string
}

variable "datacenter" {
    description = "The datacenter in which to provision compute."
    type        = string
}

variable "host_count" {
    description = "The number of bare metal hosts to provision."
    type        = number
    default     = 4
}

variable "project" {
    description = "Prefix to add to all resources for easier identification."
    type        = string
}

variable "domain_name" {
    description = "The domain name to use for all resources."
    type        = string
    default = "example.com"
}

variable "tags" {
    description = "Tags to add to all resources."
    type        = list(string)
    default     = ["project:${var.project}"]
}