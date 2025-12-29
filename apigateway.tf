resource "aws_api_gateway_rest_api" "user_api" {
  name = "UserAPI"
}

resource "aws_api_gateway_resource" "user_resource" {
  rest_api_id = aws_api_gateway_rest_api.user_api.id
  parent_id   = aws_api_gateway_rest_api.user_api.root_resource_id
  path_part   = "user"
}

resource "aws_api_gateway_method" "post_user" {
  rest_api_id   = aws_api_gateway_rest_api.user_api.id
  resource_id   = aws_api_gateway_resource.user_resource.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda_integration" {
  rest_api_id = aws_api_gateway_rest_api.user_api.id
  resource_id = aws_api_gateway_resource.user_resource.id
  http_method = aws_api_gateway_method.post_user.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.user_lambda.invoke_arn
}

resource "aws_lambda_permission" "allow_api_gateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.user_lambda.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_api_gateway_rest_api.user_api.execution_arn}/*/*"
}

resource "aws_api_gateway_deployment" "user_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.user_api.id

  depends_on = [
    aws_api_gateway_integration.lambda_integration
  ]
}

resource "aws_api_gateway_stage" "dev_stage" {
  stage_name    = "dev"
  rest_api_id  = aws_api_gateway_rest_api.user_api.id
  deployment_id = aws_api_gateway_deployment.user_api_deployment.id
}
