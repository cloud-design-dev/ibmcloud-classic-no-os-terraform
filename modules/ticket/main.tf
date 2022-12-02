# # Subject ID 1061 is for Private Network Questions
# resource "local_file" "curl_body" {

#   content = <<EOF
# {
#   "parameters": [
#     {
#       "subjectId": 1061,
#       "title": "Set DHCP helper IP for PXE boot"
#     },
#     "Please set the DHCP helper IP on VLAN ${var.private_vlan_id} in the ${var.datacenter} DC to ${var.vsi_private_ip}. If the VLAN already has a DHCP helper IP please remove it and replace it with the one listed in this ticket."
#   ]
# }
# EOF


#   filename = "${path.cwd}/ticket.json"
# }

resource "null_resource" "login_to_ibmcli" {
  provisioner "local-exec" {
    command = "ibmcloud login --no-region"
  }
}

resource "null_resource" "create_ticket" {
  provisioner "local-exec" {
    command = "ibmcloud sl ticket create --title \"DHCP Helper IP\" --subject-id 1061 --body \"Set DHCP Helper IP to ${var.vsi_private_ip} on VLAN ${var.private_vlan_id} in the ${var.datacenter} DC.\""
  }
}
