resource "aws_lambda_layer_version" "marvel_lambda_layer" {
  layer_name = "marvel-dependencies"
  s3_bucket  = aws_s3_bucket.marvel.id
  s3_key     = "dependencies.zip"

  compatible_runtimes = ["nodejs12.x"]
}
