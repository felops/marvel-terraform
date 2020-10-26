resource "aws_s3_bucket" "marvel" {
  bucket = "marvel"
  acl    = "private"

  tags = {
    Name = "marvel"
  }
}
