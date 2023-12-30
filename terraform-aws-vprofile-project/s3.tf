resource "aws_s3_bucket" "doings-s3" {
  bucket = "terra-doings-state"

  tags = {
    Name        = "Doings bucket"
    Environment = "Dev-Prod"
  }
}
