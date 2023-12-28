resource "aws_key_pair" "doingsvprofilekey" {
  key_name   = "doingsvprofilekey"
  public_key = file(var.PUB_KEY_PATH)
}
