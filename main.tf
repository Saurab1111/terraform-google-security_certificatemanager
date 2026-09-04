resource "google_certificate_manager_dns_authorization" "this" {
  for_each = toset(var.domains)

  project     = var.project_id
  name        = replace(each.value, ".", "-")
  description = "DNS authorization for ${each.value}"
  domain      = each.value
  location    = var.location
  labels      = var.labels
}

resource "google_certificate_manager_certificate" "this" {
  project     = var.project_id
  name        = var.name
  description = var.description
  location    = var.location
  labels      = var.labels

  managed {
    domains = var.domains
    dns_authorizations = [
      for auth in google_certificate_manager_dns_authorization.this : auth.id
    ]
  }
}
