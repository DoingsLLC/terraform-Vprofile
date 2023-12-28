resource "aws_s3_bucket" "example" {
  bucket = "terra-doings-state"

  tags = {
    Name        = "Doings bucket"
    Environment = "Dev-Prod"
  }
}
