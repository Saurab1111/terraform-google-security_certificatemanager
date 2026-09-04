variable "project_id" {
  type        = string
  description = "GCP project ID where Certificate Manager resources will be created."
}

variable "name" {
  type        = string
  description = "Name of the Certificate Manager certificate."
  default     = "security-certificatemanager"
}

variable "location" {
  type        = string
  description = "Location for the Certificate Manager resources."
  default     = "global"
}

variable "domains" {
  type        = list(string)
  description = "List of domains for the managed certificate."
  default     = ["example.com"]
}

variable "description" {
  type        = string
  description = "Description for the managed certificate."
  default     = "Managed certificate for HTTPS workloads protected by Cloudflare WAF."
}

variable "labels" {
  type        = map(string)
  description = "Labels to apply to Certificate Manager resources."
  default     = {}
}
