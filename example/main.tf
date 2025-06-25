provider "azurerm" {
  features {}
}



module "azure_email_comm_service" {
  source = "./../"

  communication_service_name = "acs-intliges"
  email_service_name         = "acs-intliges-email"
  resource_group_name        = ""
  data_location              = "India"

  ecs_enabled                      = true
  ecs_azure_managed_domain_enabled = true
  ecs_entra_custom_role_enabled    = true

  extra_tags = {
    environment = "dev"
    owner       = "opszero"
  }

  ecs_custom_domains = [
    {
      name                = "mail.intliges.com"
      domain_management   = "CustomerManaged"
      association_enabled = true
    }
  ]
}