terraform {
  backend "s3" {
    bucket = "doings-terra-bucket"
    key    = "terraform/backend"
    region = "us-east-1"
  }
depends_on = [aws_s3_bucket.doings-s3]
}
