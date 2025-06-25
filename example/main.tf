provider "azurerm" {
  features {}
}



module "acs" {
  source = "./../"

  communication_service_name = "acs"
  email_service_name         = "acs-email"
  resource_group_name        = ""
  data_location              = "United States"

  ecs_enabled                      = true
  ecs_azure_managed_domain_enabled = true
  ecs_entra_custom_role_enabled    = true

  extra_tags = {
    environment = "dev"
    owner       = "opszero"
  }

  ecs_custom_domains = [
    {
      name                = "mail.example.com"
      domain_management   = "CustomerManaged"
      association_enabled = true
    }
  ]
}
