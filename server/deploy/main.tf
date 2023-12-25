terraform {
  backend "s3" {
    bucket         = "blog-app-tfstate"
    key            = "blog-app-tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "blog-app-tf-state-lock"
  }
}

# provider "aws" {
#  # shared_credentials_file = "C:\Users/odofi/.aws/credentials"
#   profile = "terraform-access"
#     access_key = "${ACCESS_KEY}"
#     secret_key = "${SECRET_KEY}"
#     region = "${AWS_REGION}"
#   version = "~> 2.54.0"
# }
