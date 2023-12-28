terraform {
  backend "s3" {
    bucket = "terra-doings-state"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
