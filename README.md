<!-- BEGIN_TF_DOCS -->

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_managed_domain_enabled"></a> [azure\_managed\_domain\_enabled](#input\_azure\_managed\_domain\_enabled) | Enable or disable Azure Managed Email Domain | `bool` | `false` | no |
| <a name="input_communication_service_name"></a> [communication\_service\_name](#input\_communication\_service\_name) | Name of the Azure Communication Service | `string` | n/a | yes |
| <a name="input_custom_domain_enabled"></a> [custom\_domain\_enabled](#input\_custom\_domain\_enabled) | If true, custom domain resources will be created | `bool` | `false` | no |
| <a name="input_data_location"></a> [data\_location](#input\_data\_location) | The location where the Communication service stores its data at rest | `string` | `"United States"` | no |
| <a name="input_ecs_custom_domains"></a> [ecs\_custom\_domains](#input\_ecs\_custom\_domains) | List of custom domains to be added to the email communication service | <pre>list(object({<br/>    name                = string<br/>    domain_management   = string<br/>    association_enabled = bool<br/>  }))</pre> | `[]` | no |
| <a name="input_ecs_enabled"></a> [ecs\_enabled](#input\_ecs\_enabled) | Enable or disable all communication service resources | `bool` | `true` | no |
| <a name="input_ecs_entra_custom_role_enabled"></a> [ecs\_entra\_custom\_role\_enabled](#input\_ecs\_entra\_custom\_role\_enabled) | Enable or disable custom role definition for ACS email access | `bool` | `true` | no |
| <a name="input_email_service_name"></a> [email\_service\_name](#input\_email\_service\_name) | Name of the Azure Email Communication Service | `string` | n/a | yes |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags to apply to resources | `map(string)` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group where the communication service will be deployed | `string` | n/a | yes |
## Resources

| Name | Type |
|------|------|
| [azurerm_communication_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/communication_service) | resource |
| [azurerm_communication_service_email_domain_association.azure_managed_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/communication_service_email_domain_association) | resource |
| [azurerm_communication_service_email_domain_association.custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/communication_service_email_domain_association) | resource |
| [azurerm_email_communication_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/email_communication_service) | resource |
| [azurerm_email_communication_service_domain.azure_managed_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/email_communication_service_domain) | resource |
| [azurerm_email_communication_service_domain.custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/email_communication_service_domain) | resource |
| [azurerm_role_definition.acs_email_write](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_definition) | resource |
| [azurerm_subscription.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_managed_domain_id"></a> [azure\_managed\_domain\_id](#output\_azure\_managed\_domain\_id) | ID of Azure Managed Domain (if created) |
| <a name="output_communication_service_id"></a> [communication\_service\_id](#output\_communication\_service\_id) | ID of the Azure Communication Service |
| <a name="output_custom_domains"></a> [custom\_domains](#output\_custom\_domains) | Map of custom domain IDs (if any) |
| <a name="output_email_service_id"></a> [email\_service\_id](#output\_email\_service\_id) | ID of the Azure Email Communication Service |
# 🚀 Built by opsZero!

<a href="https://opszero.com"><img src="https://opszero.com/wp-content/uploads/2024/07/opsZero_logo_svg.svg" width="300px"/></a>

Since 2016 [opsZero](https://opszero.com) has been providing Kubernetes
expertise to companies of all sizes on any Cloud. With a focus on AI and
Compliance we can say we seen it all whether SOC2, HIPAA, PCI-DSS, ITAR,
FedRAMP, CMMC we have you and your customers covered.

We provide support to organizations in the following ways:

- [Modernize or Migrate to Kubernetes](https://opszero.com/solutions/modernization/)
- [Cloud Infrastructure with Kubernetes on AWS, Azure, Google Cloud, or Bare Metal](https://opszero.com/solutions/cloud-infrastructure/)
- [Building AI and Data Pipelines on Kubernetes](https://opszero.com/solutions/ai/)
- [Optimizing Existing Kubernetes Workloads](https://opszero.com/solutions/optimized-workloads/)

We do this with a high-touch support model where you:

- Get access to us on Slack, Microsoft Teams or Email
- Get 24/7 coverage of your infrastructure
- Get an accelerated migration to Kubernetes

Please [schedule a call](https://calendly.com/opszero-llc/discovery) if you need support.

<br/><br/>

<div style="display: block">
  <img src="https://opszero.com/wp-content/uploads/2024/07/aws-advanced.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-public-sector.png" width="150px" />
  <img src="https://opszero.com/wp-content/uploads/2024/07/AWS-eks.png" width="150px" />
</div>
<!-- END_TF_DOCS -->