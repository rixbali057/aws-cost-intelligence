
# ----------------------------
# Lambda Function
# ----------------------------

resource "aws_lambda_function" "cost_lambda" {

  function_name = var.lambda_name

  filename = "../lambda.zip"

  source_code_hash = filebase64sha256("../build/lambda.zip")

  role = aws_iam_role.lambda_role.arn

  runtime = var.runtime

  handler = "lambda_function.lambda_handler"
}