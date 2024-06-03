data "azuread_client_config" "current" {}

resource "random_uuid" "Oauth2PermissionScopeId" {
}

resource "random_uuid" "AppRoleUserAppId" {
}

resource "random_uuid" "AppRoleServerAppId" {
}

resource "azuread_application" "AppRegistration" {
  display_name                      = var.app_registration_config.display_name
  owners                            = [data.azuread_client_config.current.object_id]
  sign_in_audience                  = var.app_registration_config.sign_in_audience
 
  api { 
    mapped_claims_enabled           = var.app_registration_config.api.mapped_claims_enabled
    requested_access_token_version  = var.app_registration_config.api.requested_access_token_version

    oauth2_permission_scope {
      admin_consent_description     = var.app_registration_config.api.oauth2_permission_scope.admin_consent_description
      admin_consent_display_name    = var.app_registration_config.api.oauth2_permission_scope.admin_consent_display_name
      enabled                       = var.app_registration_config.api.oauth2_permission_scope.enabled
      id                            = random_uuid.Oauth2PermissionScopeId.result
      type                          = var.app_registration_config.api.oauth2_permission_scope.type
      user_consent_description      = var.app_registration_config.api.oauth2_permission_scope.user_consent_description
      user_consent_display_name     = var.app_registration_config.api.oauth2_permission_scope.user_consent_display_name
      value                         = var.app_registration_config.api.oauth2_permission_scope.value
    } 
  } 
 
  app_role { 
    allowed_member_types            = var.app_registration_config.app_role.user.allowed_member_types
    description                     = var.app_registration_config.app_role.user.description
    display_name                    = var.app_registration_config.app_role.user.display_name
    enabled                         = var.app_registration_config.app_role.user.enabled
    id                              = random_uuid.AppRoleUserAppId.result
    value                           = var.app_registration_config.app_role.user.value
  }

  app_role {
    allowed_member_types            = var.app_registration_config.app_role.server.allowed_member_types
    description                     = var.app_registration_config.app_role.server.description
    display_name                    = var.app_registration_config.app_role.server.display_name
    enabled                         = var.app_registration_config.app_role.server.enabled
    id                              = random_uuid.AppRoleServerAppId.result
    value                           = var.app_registration_config.app_role.server.value
  }

  optional_claims {
    access_token {
      name                          = var.app_registration_config.optional_claims.access_token.auth_time.name
      source                        = var.app_registration_config.optional_claims.access_token.auth_time.source
			essential                     = var.app_registration_config.optional_claims.access_token.auth_time.essential
			additional_properties         = var.app_registration_config.optional_claims.access_token.auth_time.additional_properties
    } 

    access_token { 
      name                          = var.app_registration_config.optional_claims.access_token.upn.name
      source                        = var.app_registration_config.optional_claims.access_token.upn.source
			essential                     = var.app_registration_config.optional_claims.access_token.upn.essential
			additional_properties         = var.app_registration_config.optional_claims.access_token.upn.additional_properties
    } 
  } 

  web {
    homepage_url                    = var.app_registration_config.web.homepage_url
    logout_url                      = var.app_registration_config.web.logout_url
    redirect_uris                   = var.app_registration_config.web.redirect_uris
    implicit_grant {
      access_token_issuance_enabled = var.app_registration_config.web.implicit_grant.access_token_issuance_enabled
      id_token_issuance_enabled     = var.app_registration_config.web.implicit_grant.id_token_issuance_enabled
    }
  }

  lifecycle {
    ignore_changes = [
      identifier_uris,
      required_resource_access
    ]
  }
}

resource "azuread_application_identifier_uri" "IdentifierUri" {
  application_id                    = azuread_application.AppRegistration.id
  identifier_uri                    = "${var.app_registration_config.prefix_identifier_uri}${azuread_application.AppRegistration.id}${var.app_registration_config.suffix_identifier_uri}"
}

resource "azuread_application_api_access" "MicrosoftGraph" {
  application_id                    = azuread_application.AppRegistration.id
  api_client_id                     = var.app_registration_config.api_access.microsoft_graph.api_client_id
  scope_ids                         = var.app_registration_config.api_access.microsoft_graph.scope_ids
}

resource "azuread_application_api_access" "AzureServiceManagement" {
  application_id                    = azuread_application.AppRegistration.id
  api_client_id                     = var.app_registration_config.api_access.azure_service_management.api_client_id
  scope_ids                         = var.app_registration_config.api_access.azure_service_management.scope_ids
}

resource "azuread_application_api_access" "AppRegistration" {
  application_id = azuread_application.AppRegistration.id
  api_client_id  = azuread_application.AppRegistration.id
  scope_ids = [
    random_uuid.Oauth2PermissionScopeId.result
  ]
}
