variable "communication_service_name" {
  description = "Name of the Azure Communication Service"
  type        = string
}

variable "email_service_name" {
  description = "Name of the Azure Email Communication Service"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the communication service will be deployed"
  type        = string
}

variable "data_location" {
  description = "The location where the Communication service stores its data at rest"
  type        = string
  default     = "United States"
}

variable "ecs_enabled" {
  description = "Enable or disable all communication service resources"
  type        = bool
  default     = true
}

variable "azure_managed_domain_enabled" {
  description = "Enable or disable Azure Managed Email Domain"
  type        = bool
  default     = false
}

variable "ecs_entra_custom_role_enabled" {
  description = "Enable or disable custom role definition for ACS email access"
  type        = bool
  default     = true
}

variable "ecs_custom_domains" {
  description = "List of custom domains to be added to the email communication service"
  type = list(object({
    name                = string
    domain_management   = string
    association_enabled = bool
  }))
  default = []
}

variable "extra_tags" {
  description = "Additional tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "custom_domain_enabled" {
  description = "If true, custom domain resources will be created"
  type        = bool
  default     = false
}

variable "acs_email_role_name" {
  description = "The name of the custom role for ACS Email Write"
  type        = string
  default     = "ACS Email Write"
}