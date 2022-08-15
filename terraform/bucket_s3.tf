resource "aws_s3_bucket" "b" {
    bucket = var.bucket_name 

  tags = {
    Name        = "My bucket"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl = var.acl_value   
}