output "cf_domain_name" {
  value = aws_cloudfront_distribution.this.domain_name
}
output "cert_arn" {
    value = aws_acm_certificate.this.arn 
}
output "bucket_name" {
    value = aws_s3_bucket.this.id
  
}