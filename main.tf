variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-tf-test-bucket-20230319-0000001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "test-s3-acl" {
  bucket = aws_s3_bucket.test-bucket.id
  acl    = "private"
}
