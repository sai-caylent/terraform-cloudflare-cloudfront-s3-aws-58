# terraform-module-template
## How to use this template
1. Generate the new repository based on this template.
2. Edit the files from the root as you need
   1. main.tf
   2. versions.tf
   3. variables.tf
   4. outputs.tf
3. Generate at least one example, like the one in ````examples/complete ````
4. Update the [Usage section](#usage).
5. Install [pre-commit](#how-to-use-pre-commit)
6. Generate the [terraform-docs](#terraform-docs)
7. Create a new PR, and merge the PR once that passes all the checks.
8. [Release a new version of the module](#release-a-new-version-with-the-github-cli).
9.  Remove this section from the new module.


## Usage
```terraform
module "cf_with_s3" {
    source = "../.."
    domain_name = "lab.sai.com"
   
}
```


## Install and configure the tools
````shell
brew install jq
brew install terraform-docs
brew install gh
brew install pre-commit
brew install tfsec
brew install checkov
brew install tflint

gh auth login
````
## How to use pre-commit
```shell
# in the root of the module
pre-commit install
pre-commit run -a
```
## How to document
### Terraform Docs
```shell
# In the root of the module
terraform-docs markdown table --output-file README.md .
```
Note: the terraform-docs is generated with the GitHub Action ```` .github/workflows/tfdocs````, but you will have to
update your branch since it is updated in the PR.
## Release a new version with the GitHub cli
The version number must have the format vX.Y.Z or X.Y.Z
```shell
gh release create v0.0.5 --target main
```

<!-- BEGIN_TF_DOCS -->
# Examples
## Complete
```hcl
module "this" {
    source = "../.."
    domain_name = "lab.sai.com"
    comment_cdn = "proxy cdn for f45 cloudflare"
    price_class = "PriceClass_100"
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.35.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret_name"></a> [domain_name](#input\_secret\_name) | Name for the bucket and name for the certificate  | `string` | n/a | yes |
| <a name="input_secret_name"></a> [is_ipv6_enabled](#input\_secret\_name) | Enable ipv6 on CDN | `string` | n/a | yes |
| <a name="input_secret_name"></a> [price_class](#input\_secret\_name) | The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100. Default is PriceClass_All  | `string` | n/a | yes |
| <a name="input_secret_name"></a> [default_root_object](#input\_secret\_name) | "The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL. | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_name"></a> [cf_domain_name](#output\_secret\_name) | Domain name of the cloudfront distribution |
| <a name="output_secret_name"></a> [bucket_name](#output\_secret\_name) | S3 bucket name |
## Resources

- resource.aws_s3_bucket.this(main.tf#20)
- resource.aws_cloudfront_distribution.this (cdn.tf#11)
- resource.aws_acm_certificate.this(main.tf#44)
<!-- END_TF_DOCS -->
