variable "cache_policy_name" {
  default = "Managed-CachingDisabled"
}
data "aws_cloudfront_cache_policy" "cache_policy" {
  name = var.cache_policy_name
}
locals {
  s3_origin_id = var.domain_name
  bucket_regional_domain_name = aws_s3_bucket.this.bucket_regional_domain_name
}
resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name              = local.bucket_regional_domain_name
    origin_id                = "files_oac"
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  comment             = var.comment_cdn
  price_class         = var.price_class
  default_root_object = var.default_root_object

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "files_oac"
    cache_policy_id        = data.aws_cloudfront_cache_policy.cache_policy.id
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
  }


  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA"]
    }
  }

  viewer_certificate {
    # acm_certificate_arn = aws_acm_certificate.this.arn
    # ssl_support_method = "sni-only"
    cloudfront_default_certificate = true
  }

}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = "test-sai"
  description                       = "testing for f45 project S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

