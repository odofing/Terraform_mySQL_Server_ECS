terraform {
  backend "s3" {
    bucket         = "blog-app-tfstate"
    key            = "blog-app-tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "blog-app-tf-state-lock"
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}

locals {
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    Owner       = var.contact
    ManagedBy   = "Terraform"
  }
}

# it retrieves current region
data "aws_region" "current" {}