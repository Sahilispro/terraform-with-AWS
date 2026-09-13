terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "My-First-bucket" {
    bucket =  "sahil-my-tf-test-bucket"
    
    tags = {
      Name = "my-tf-test-bucket"
      Env = "Dev"
    }
}

resource "aws_s3_bucket_public_access_block" "My-First-bucket" {
    bucket = aws_s3_bucket.My-First-bucket.id

    block_public_acls       = true
    block_public_policy     = true
    ignore_public_acls      = true
    restrict_public_buckets = false
}