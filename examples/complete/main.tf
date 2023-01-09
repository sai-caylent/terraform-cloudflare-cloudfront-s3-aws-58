module "cf_with_s3" {
    source = "../.."
    domain_name = "lab.sai.com"
    comment_cdn = "proxy cdn for f45 cloudflare"
    price_class = "PriceClass_100"
}