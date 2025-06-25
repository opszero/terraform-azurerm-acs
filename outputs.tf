output "communication_service_id" {
  description = "ID of the Azure Communication Service"
  value       = try(azurerm_communication_service.main[0].id, null)
}

output "email_service_id" {
  description = "ID of the Azure Email Communication Service"
  value       = try(azurerm_email_communication_service.main[0].id, null)
}

output "azure_managed_domain_id" {
  description = "ID of Azure Managed Domain (if created)"
  value       = try(azurerm_email_communication_service_domain.azure_managed_domain[0].id, null)
}

output "custom_domains" {
  description = "Map of custom domain IDs (if any)"
  value = try({
    for k, v in azurerm_email_communication_service_domain.custom_domain : k => v.id
  }, {})
}

