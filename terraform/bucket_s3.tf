resource "aws_s3_bucket" "bucket" {
    bucket = var.bucket_name 

  tags = {
    Name        = "EX1_aws_polybot"
    Environment = "prod"
  }
}
resource "aws_s3_bucket_acl" "buck_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = "private"
}
# Upload an object
resource "aws_s3_object" "assassinatos" {
  bucket = aws_s3_bucket.bucket.id
  key    = "data/.envfile"
  acl    = "private"
  source = "D:/elements/project/PolyBot/.envfile"
#  etag   = filemd5("D:/elements/project/PolyBot/.envfile")
}
resource "aws_s3_object" "telegram" {
  bucket = aws_s3_bucket.bucket.id
  key    = "data/.telegramToken"
  acl    = "private"
  source = "D:/elements/project/PolyBot/.telegramToken"
#  etag   = filemd5("D:/elements/project/PolyBot/.envfile")
}