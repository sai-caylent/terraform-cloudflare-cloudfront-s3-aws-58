provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Environment = "Test"
      Owner       = "Sai"
      Project     = "F45"
    }
  }
}