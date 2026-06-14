provider "aws" {
  region = "us-east-1"
}

# ----------------------------
# IAM Role
# ----------------------------

resource "aws_iam_role" "lambda_role" {

  name = "aws-cost-report-dev-role-tf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Action = "sts:AssumeRole"

        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# ----------------------------
# Lambda Basic Policy
# ----------------------------

resource "aws_iam_role_policy_attachment" "basic_execution" {

  role = aws_iam_role.lambda_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

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