# communication_service
# --------------------------
resource "azurerm_communication_service" "main" {
  count               = var.ecs_enabled ? 1 : 0
  name                = var.communication_service_name
  resource_group_name = var.resource_group_name
  data_location       = var.data_location
  tags                = var.extra_tags
}


# --------------------------
# email_service
# --------------------------
resource "azurerm_email_communication_service" "main" {
  count               = var.ecs_enabled ? 1 : 0
  name                = var.email_service_name
  resource_group_name = var.resource_group_name
  data_location       = var.data_location
  tags                = var.extra_tags
}

# --------------------------
# email_domains
# --------------------------
resource "azurerm_email_communication_service_domain" "azure_managed_domain" {
  count             = var.ecs_enabled && var.azure_managed_domain_enabled ? 1 : 0
  name              = "AzureManagedDomain"
  email_service_id  = azurerm_email_communication_service.main[0].id
  domain_management = "AzureManaged"
  tags              = var.extra_tags
}

resource "azurerm_email_communication_service_domain" "custom_domain" {
  for_each = {
    for d in var.ecs_custom_domains : d.name => d if var.ecs_enabled &&  var.custom_domain_enabled
  }
  name              = each.value.name
  email_service_id  = azurerm_email_communication_service.main[0].id
  domain_management = each.value.domain_management
  tags              = var.extra_tags
}

# --------------------------
# domain_associations
# --------------------------
resource "azurerm_communication_service_email_domain_association" "azure_managed_domain" {
  count                    = var.ecs_enabled && var.azure_managed_domain_enabled ? 1 : 0
  communication_service_id = azurerm_communication_service.main[0].id
  email_service_domain_id  = azurerm_email_communication_service_domain.azure_managed_domain[0].id
}

resource "azurerm_communication_service_email_domain_association" "custom_domain" {
  for_each = {
    for d in var.ecs_custom_domains : d.name => d if var.ecs_enabled && var.custom_domain_enabled && d.association_enabled
  }
  communication_service_id = azurerm_communication_service.main[0].id
  email_service_domain_id  = azurerm_email_communication_service_domain.custom_domain[each.key].id
}

# --------------------------
# role_definition
# --------------------------
data "azurerm_subscription" "main" {}

resource "azurerm_role_definition" "acs_email_write" {
  count       = var.ecs_enabled && var.ecs_entra_custom_role_enabled ? 1 : 0
  name        = "ACS Email Write"
  scope       = data.azurerm_subscription.main.id
  description = "Custom role to allow ACS Email Write."

  permissions {
    actions = [
      "Microsoft.Communication/CommunicationServices/Read",
      "Microsoft.Communication/EmailServices/Write"
    ]
    not_actions = []
  }

  assignable_scopes = [
    data.azurerm_subscription.main.id
  ]
}