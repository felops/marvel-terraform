resource "aws_lambda_permission" "apigw_get_heroes_by_movies" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_heroes_by_movies.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.marvel.execution_arn}/*/*/*"
}

data "aws_iam_policy_document" "get_heroes_by_movies" {
  statement {
    actions = [
      "dynamodb:Scan",
    ]

    resources = [
      aws_dynamodb_table.marvel_heroes.arn,
      aws_dynamodb_table.marvel_movies.arn,
    ]
  }
}

resource "aws_iam_role" "marvel_get_heroes_by_movies" {
  name               = "marvel-get-heroes-by-movies"
  assume_role_policy = data.aws_iam_policy_document.lambda_iam.json
}

resource "aws_iam_role_policy" "main" {
  name   = "marvel-aws-iam-role-policy"
  policy = data.aws_iam_policy_document.get_heroes_by_movies.json
  role   = aws_iam_role.marvel_get_heroes_by_movies.id
}

resource "aws_lambda_function" "get_heroes_by_movies" {
  function_name = "marvel-get-heroes-by-movies"
  s3_bucket     = aws_s3_bucket.marvel.id
  s3_key        = "lambda-template.zip"
  role          = aws_iam_role.marvel_get_heroes_by_movies.arn
  handler       = "heroes/controllers/get-heroes-by-movies.handler"
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
