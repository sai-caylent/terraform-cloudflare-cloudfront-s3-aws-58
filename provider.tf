data "aws_region" "primary" {}

provider "aws" {
  alias  = "alternate_region"
  region = "us-east-1"
}
data "aws_region" "alternate" {
  provider = aws.alternate_region
}

output "primary" {
  value = data.aws_region.primary.name

}
output "alternate" {
  value = data.aws_region.alternate.name

}