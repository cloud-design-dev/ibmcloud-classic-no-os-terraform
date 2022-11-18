# Subject ID 1061 is for Private Network Questions
resource "local_file" "curl_body" {

  content = <<EOF
{
  "parameters": [
    {
      "subjectId": 1061,
      "title": "Set DHCP helper IP for PXE boot"
    },
    "Please set the DHCP helper IP on VLAN ${var.private_vlan_id} in the ${var.datacenter} DC to ${var.vsi_private_ip}. If the VLAN already has a DHCP helper IP please remove it and replace it with the one listed in this ticket."
  ]
}
EOF


  filename = "${path.cwd}/ticket.json"
}

resource "null_resource" "create_ticket" {
  depends_on = [local_file.curl_body]

  provisioner "local-exec" {
    command = "curl -u ${var.iaas_classic_username}:${var.iaas_classic_api_key} -X POST -H 'Accept: */*' -H 'Accept-Encoding: gzip, deflate, compress' -d @${path.cwd}/ticket.json 'https://api.softlayer.com/rest/v3.1/SoftLayer_Ticket/createStandardTicket.json'"
  }
}