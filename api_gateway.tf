resource "aws_api_gateway_rest_api" "marvel" {
  name = "marvel"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  tags = {
    Name = "marvel"
  }
}

resource "aws_api_gateway_deployment" "default" {
  depends_on  = [aws_api_gateway_integration.lambda_get_heroes_integration]
  rest_api_id = aws_api_gateway_rest_api.marvel.id
  stage_name  = "default"
}
