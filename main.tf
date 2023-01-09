data "aws_iam_policy_document" "this" {
  #policy for OAC

  statement {
    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.this.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.this.arn]
    }
  }
}
resource "aws_s3_bucket" "this" {
  bucket = var.domain_name
  
}
resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}
resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_s3_bucket_website_configuration" "example2" {
  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}
resource "aws_acm_certificate" "this" {
  provider          = aws.alternate_region
  domain_name       = var.domain_name
  subject_alternative_names = var.alternative_domain_names
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}