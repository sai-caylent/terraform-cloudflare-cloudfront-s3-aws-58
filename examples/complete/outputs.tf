output "cf_domain_name" {
    value = module.cf_with_s3.cf_domain_name 
}
output "bucket_name" {
    value = module.cf_with_s3.bucket_name
}