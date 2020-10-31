resource "aws_lambda_permission" "apigw_get_hero" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_hero.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.marvel.execution_arn}/*/*/*"
}

resource "aws_lambda_function" "get_hero" {
  function_name = "marvel-get-hero"
  s3_bucket     = aws_s3_bucket.marvel.id
  s3_key        = "lambda-template.zip"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "heroes/controllers/get-hero.handler"
  layers        = [aws_lambda_layer_version.marvel_lambda_layer.arn]
  runtime       = "nodejs12.x"

  environment {
    variables = {
      MARVEL_API_URL     = var.marvel_api_url
      MARVEL_PRIVATE_KEY = data.aws_ssm_parameter.marvel_private_key.value
      MARVEL_PUBLIC_KEY  = data.aws_ssm_parameter.marvel_public_key.value
    }
  }

  tags = {
    Name = "marvel"
  }
}
