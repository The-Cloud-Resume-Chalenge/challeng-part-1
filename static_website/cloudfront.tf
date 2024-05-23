resource "aws_cloudfront_distribution" "product_s3_distribution" {
  provider = aws.abd
  origin {
    domain_name = aws_s3_bucket.majid.bucket_regional_domain_name
    origin_id   = "${aws_s3_bucket.majid.id}-origin"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for staging"
  default_root_object = var.index_document

  aliases = local.custom_domain_exists ? [var.dns] : []

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "${aws_s3_bucket.majid.id}-origin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = local.custom_domain_exists ? aws_acm_certificate.default[0].arn : null
    cloudfront_default_certificate = local.custom_domain_exists ? null : true
    ssl_support_method             = local.custom_domain_exists ? "sni-only" : "vip"
    minimum_protocol_version       = "TLSv1.2_2019"
  }
}