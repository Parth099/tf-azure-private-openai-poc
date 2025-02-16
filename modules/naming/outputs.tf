locals {
  env = var.env_shorthand[var.environment]
  rgn = var.region_shorthand[var.region]
  svc = var.svc_shorthand[var.svc_name]

  prefix = "${var.application_name}-${local.rgn}"
  suffix = "${local.svc}-${local.env}"
  name   = "${local.prefix}-${local.suffix}"
}

output "prefix" {
  value       = local.prefix
  description = "Prefix of the Resource Name"
}

output "suffix" {
  value       = local.suffix
  description = "Suffix of the Resource Name"
}

output "name" {
  value       = local.name
  description = "Full Name of the Resource"
}
