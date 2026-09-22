terraform {
  required_version = ">= 1.16.2"
  
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

variable "region" {
  type = string
}

variable "environment" {
  type = string
}

variable "owner_name" {
  type = string
}

variable "suffix" {
  type = string
}

locals {
  bucket_name = lower("${var.environment}-${var.owner_name}-${var.suffix}")
}

resource "aws_s3_bucket" "this" {
  bucket = local.bucket_name

  tags = {
    Name   = local.bucket_name
    Owner  = var.owner_name
    Env    = var.environment
    Region = var.region
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = false
}
