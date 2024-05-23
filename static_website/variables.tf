variable "profile" {
  type = string
}

variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

variable "use_aws_profile" {
  description = "Set to true to use AWS profile, or false to use access keys"
  type        = bool
}

variable "region_master" {
  type = string
}

variable "dns" {
  type = string
}


variable "index_document" {
  type = string
}

variable "error_document" {
  type = string
}


variable "default_code_repository" {
  type = string
}


# Boolean variable to check for custom domain existence based on the dns variable.
variable "custom_domain_exists" {
  description = "Determines if a custom domain exists based on whether 'dns' is set."
  type        = bool
}

# =============================== Outputs ======================================

output "cloudfront_distribution_domain_name" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.product_s3_distribution.domain_name
}

output "custom_domain_exists" {
  description = "Boolean flag indicating if a custom domain DNS zone exists."
  value       = length(data.aws_route53_zone.public_zone) > 0 ? true : false
}