# Example Roll Your Own VMware on Classic

This code will create the following resources:

 - New Public and Private VLANs for BM and Virtual instances
 - Bare Metal hosts with NO_OS (VMware will be loaded via IPMI ISO)
 - Juniper vSRX deployed as frontend for BM/Virtual compute hosts
 - Virtual Instance to act as SMB server

## Requirements

| Name | Description |
|------|---------|
| <a name="Classic IaaS API Key"></a> [Classic IaaS API Key](https://cloud.ibm.com/docs/account?topic=account-classic_keys) | Classic IaaS API Key with permissions to deploy and manage infrastructure |
| <a name="Classic IaaS Username"></a> [Classic IaaS Username](https://cloud.ibm.com/docs/account?topic=account-classic_keys) | Classic IaaS Username with permissions to deploy and manage infrastructure |
| <a name="Terraform"></a> [Terraform](https://developer.hashicorp.com/terraform/downloads?) | Terraform installed locally **(Needed for local deployment)** |
| (Optional) <a name="IBM Cloud CLI"></a>[IBM Cloud CLI](https://cloud.ibm.com/docs/cli?topic=cli-install-ibmcloud-cli) | IBM Cloud CLI installed **(Needed for local deployment)** |

If you don't have Terraform or the IBM Cloud CLI installed locally, you can use [IBM Cloud Shell](https://cloud.ibm.com/shell) to deploy the resources. 

## Deploy Resources

1. Clone repository
    
    ```shell
    git clone https://github.com/greyhoundforty/rh-vmware-classic-terraform.git
    cd rh-vmware-classic-terraform
    ```

2. Move and update `tfvars` file. *Note*: The gitignore file in this repository will not track your `tfvars` file so if you are running this in a CI/CD system you will have to provide the variables at runtime

    ```shell
    cp terraform-tfvars-examples terraform.tfvars
    ```
    
3. Open `terraform.tfvars` in your text editor and fill in the required variables. See the [inputs](./TFINFO.md#inputs) file for the variable definitions and types.

4. Intitialize Terraform and create deployment plan
If everything is configured properly you can now move on to initializing Terraform and running a plan to see the proposed deployment

    ```shell
    terraform init
    terraform plan -out default.tfplan
    ```
   
5. Deploy classic resources

    ```shell
    terraform apply
    ```
    
## Todo

 - [x] Update requirements for `ibmcloud` CLI 
 - [x] Move Classic VSI creation to be directly after the VLAN creation. 
 - [ ] Use `local-exec` to create support ticket with the VLAN Number and Classic VSI Private IP directly adter the Classic VSI creation
 - [ ] Test in cloud shell 
 - [ ] Create Schematics Deploy button
