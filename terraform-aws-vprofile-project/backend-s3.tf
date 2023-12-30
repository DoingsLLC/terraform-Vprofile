terraform {
  backend "s3" {
    bucket = "doings-terra-bucket"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "doings-s3" {
  # Your AWS S3 bucket configuration goes here
  bucket = "terra-doings-state"

  tags = {
    Name        = "Doings bucket"
    Environment = "Dev-Prod"
  }
}

# Declare a dependency of the aws_s3_bucket resource on the terraform block
# This ensures that the S3 bucket is created before configuring the backend
resource "null_resource" "dependency" {
  depends_on = [aws_s3_bucket.doings-s3]
}
