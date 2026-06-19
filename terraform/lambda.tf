
# ----------------------------
# Lambda Function
# ----------------------------

resource "aws_lambda_function" "cost_lambda" {

  function_name = var.lambda_name
  
  filename = data.archive_file.lambda_zip.output_path
  
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  role = aws_iam_role.lambda_role.arn

  runtime = var.runtime

  handler = "lambda_function.lambda_handler"
}