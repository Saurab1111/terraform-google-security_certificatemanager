output "certificate_id" {
  description = "ID of the Certificate Manager certificate."
  value       = google_certificate_manager_certificate.this.id
}

output "certificate_name" {
  description = "Name of the Certificate Manager certificate."
  value       = google_certificate_manager_certificate.this.name
}

output "dns_authorizations" {
  description = "DNS authorization records required for domain validation."
  value = {
    for domain, auth in google_certificate_manager_dns_authorization.this :
    domain => {
      dns_resource_record = auth.dns_resource_record
      id                  = auth.id
    }
  }
}
