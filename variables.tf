variable "domain_name" {
    type = string
    description = "the name of the bucket"
    
}
variable "alternative_domain_names" {
    type = list(string)
    description = "Alternative domain name for ACM certificate"  
    default = [ "sai.cloudns.ph" ]
}
variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
  default     = true
}
variable "is_ipv6_enabled" {
    type = bool
    description = "Enable ipv6 on CDN"
    default = false
}
variable "comment_cdn" {
    type = string
    description = "Description for CDN"
    default = "testing for f45 project S3 bucket"
}

variable "price_class" {
  description = "The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
  type        = string
  default     = "PriceClass_All"
}
variable "default_root_object" {
  description = "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = "index.html"
}