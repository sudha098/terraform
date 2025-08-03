resource "aws_s3_bucket" "mybucket" {
  bucket = "sudha-18-10-22"
}

resource "aws_s3_bucket_acl" "mybucket_acl" {
  bucket = aws_s3_bucket.mybucket.id
  acl    = "private"
}