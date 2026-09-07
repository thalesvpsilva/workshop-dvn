terraform {
  backend "s3" {
    bucket       = "workshop-dvn-remote-backend-bucket-thales"
    key          = "eks/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    # Deprecated: Use S3 instead of DynamoDB for state locking.
    # dynamodb_table = "workshop-dvn-state-locking-table"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.assume_role.region
  default_tags {
    tags = var.default_tags
  }
  assume_role {
    role_arn = var.assume_role.arn

  }
}
