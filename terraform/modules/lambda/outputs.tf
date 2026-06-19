output "lambda_arn" {
  value = aws_lambda_function.cost_lambda.arn
}

output "lambda_name" {
  value = aws_lambda_function.cost_lambda.function_name
}