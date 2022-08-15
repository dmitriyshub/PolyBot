resource "aws_s3_bucket" "b" {
    bucket = var.bucket_name 

  tags = {
    Name        = "EX1_aws_polybot"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl = var.acl_value   
}