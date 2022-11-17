<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | 1.48.0-beta0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | 1.48.0-beta0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_bare-metal-hosts"></a> [bare-metal-hosts](#module\_bare-metal-hosts) | ./modules/compute-bare-metal | n/a |
| <a name="module_gateway-appliances"></a> [gateway-appliances](#module\_gateway-appliances) | ./modules/gateway-appliance | n/a |
| <a name="module_virtual-machines"></a> [virtual-machines](#module\_virtual-machines) | ./modules/compute-virtual | n/a |
| <a name="module_vlans"></a> [vlans](#module\_vlans) | ./modules/vlans | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_compute_ssh_key.project](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.48.0-beta0/docs/resources/compute_ssh_key) | resource |
| [tls_private_key.ssh](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [ibm_compute_ssh_key.existing](https://registry.terraform.io/providers/IBM-Cloud/ibm/1.48.0-beta0/docs/data-sources/compute_ssh_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | The datacenter in which to provision compute. | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name to use for all resources. | `string` | `"example.com"` | no |
| <a name="input_existing_ssh_key"></a> [existing\_ssh\_key](#input\_existing\_ssh\_key) | The name of an existing SSH key to use for the virtual machines. If none is provided, one will be generated. | `string` | `""` | no |
| <a name="input_host_count"></a> [host\_count](#input\_host\_count) | The number of bare metal hosts to provision. | `number` | `4` | no |
| <a name="input_iaas_classic_api_key"></a> [iaas\_classic\_api\_key](#input\_iaas\_classic\_api\_key) | The API key for the IBM Cloud Classic infrastructure service. | `string` | n/a | yes |
| <a name="input_iaas_classic_username"></a> [iaas\_classic\_username](#input\_iaas\_classic\_username) | The username for the IBM Cloud Classic infrastructure service. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Prefix to add to all resources for easier identification. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bare_metal_host_ids"></a> [bare\_metal\_host\_ids](#output\_bare\_metal\_host\_ids) | Returns host IDs for all deployed bare metal servers. |
| <a name="output_bare_metal_host_private_ips"></a> [bare\_metal\_host\_private\_ips](#output\_bare\_metal\_host\_private\_ips) | Returns host Private Ips for all deployed bare metal servers. |
| <a name="output_bare_metal_host_public_ips"></a> [bare\_metal\_host\_public\_ips](#output\_bare\_metal\_host\_public\_ips) | Returns host Public Ips for all deployed bare metal servers. |
| <a name="output_bare_metal_hosts"></a> [bare\_metal\_hosts](#output\_bare\_metal\_hosts) | Returns host info for all deployed bare metal servers. |
| <a name="output_private_vlan_number"></a> [private\_vlan\_number](#output\_private\_vlan\_number) | Returns the private VLAN number. |
| <a name="output_virtual_machine"></a> [virtual\_machine](#output\_virtual\_machine) | Returns host info for all deployed virtual instance. |
<!-- END_TF_DOCS -->