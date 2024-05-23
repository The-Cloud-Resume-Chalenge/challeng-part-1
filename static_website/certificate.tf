# Assuming you want to reference an existing hosted zone
data "aws_route53_zone" "public_zone" {
  count    = var.dns != "" ? 1 : 0
  provider = aws.abd
  name     = "${var.dns}."
}

locals {
  # This local value checks if the DNS data has been retrieved successfully
  custom_domain_exists = length(data.aws_route53_zone.public_zone) > 0 ? true : false
}


resource "aws_acm_certificate" "default" {
  count                     = local.custom_domain_exists ? 1 : 0
  provider                  = aws.abd
  domain_name               = var.dns
  subject_alternative_names = [format("*.%s", var.dns)]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "validation" {
  count = local.custom_domain_exists ? length(aws_acm_certificate.default) : 0

  provider = aws.abd
  zone_id  = data.aws_route53_zone.public_zone[count.index].zone_id

  name    = element(tolist(aws_acm_certificate.default[count.index].domain_validation_options.*.resource_record_name), 0)
  type    = element(tolist(aws_acm_certificate.default[count.index].domain_validation_options.*.resource_record_type), 0)
  records = [element(tolist(aws_acm_certificate.default[count.index].domain_validation_options.*.resource_record_value), 0)]
  ttl     = 60
}
