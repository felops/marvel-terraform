resource "aws_dynamodb_table" "marvel_movies" {
  name           = "marvel-movies"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "name"

  attribute {
    name = "name"
    type = "S"
  }

  tags = {
    Name = "marvel"
  }
}
