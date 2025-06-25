output "module_communication_service_id" {
  description = "ID of Communication Service from module"
  value       = module.acs.communication_service_id
}

output "module_email_service_id" {
  description = "ID of Email Service from module"
  value       = module.acs.email_service_id
}

output "module_azure_managed_domain_id" {
  description = "ID of Azure Managed Email Domain"
  value       = module.acs.azure_managed_domain_id
}

output "module_custom_domain_ids" {
  description = "Custom domain IDs map from module"
  value       = module.acs.custom_domains
}
