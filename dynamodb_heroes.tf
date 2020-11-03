resource "aws_dynamodb_table" "marvel_heroes" {
  name           = "marvel-heroes"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "N"
  }

  tags = {
    Name = "marvel"
  }
}
