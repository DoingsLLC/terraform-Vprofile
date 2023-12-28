terraform {
  backend "s3" {
    bucket = "doings-terra-bucket"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
