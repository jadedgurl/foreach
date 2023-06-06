terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_availability_zones" "all" {}

  # Use for_each to loop over var.custom_tags
  dynamic "tag" {
    for_each = var.custom_tags
     tags = {
    Name        = "My bucket"
    Environment = "Dev"
    }
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  }
}

