data "ibm_compute_ssh_key" "existing" {
  count = var.existing_ssh_key != "" ? 1 : 0
  label = var.existing_ssh_key
}