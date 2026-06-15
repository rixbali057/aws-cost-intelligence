
# ----------------------------
# Lambda Function
# ----------------------------

resource "aws_lambda_function" "cost_lambda" {

  function_name = "aws-cost-report-dev-tf"

  filename = "../lambda.zip"

  source_code_hash = filebase64sha256("../lambda.zip")

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.13"

  handler = "lambda_function.lambda_handler"
}