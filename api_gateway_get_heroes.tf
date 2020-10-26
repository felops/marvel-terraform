resource "aws_api_gateway_method" "get_heroes" {
  rest_api_id   = aws_api_gateway_rest_api.marvel.id
  resource_id   = aws_api_gateway_rest_api.marvel.root_resource_id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_get_heroes_integration" {
  rest_api_id             = aws_api_gateway_rest_api.marvel.id
  resource_id             = aws_api_gateway_rest_api.marvel.root_resource_id
  http_method             = aws_api_gateway_method.get_heroes.http_method
  type                    = "AWS_PROXY"
  integration_http_method = "POST"
  uri                     = aws_lambda_function.get_heroes.invoke_arn
}
