resource "aws_lambda_function" "cost_lambda" {

  function_name = var.lambda_name

  filename = var.filename

  source_code_hash = var.source_code_hash

  role = var.role_arn

  runtime = var.runtime

  handler = "lambda_function.lambda_handler"
}