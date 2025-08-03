provider "aws" {
  region  = "us-east-1"
  profile = "sudha_udemy"
}


resource "aws_s3_bucket" "mybucket" {
  bucket = "sudha-22-feb-2023"

  tags = {
    Project = "Testing"
    Team    = "DevOps"
  }
}

resource "aws_s3_bucket_acl" "mybucket_acl" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = "private"
}