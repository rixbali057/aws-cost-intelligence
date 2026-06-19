
# ----------------------------
# Lambda Function
# ----------------------------

module "lambda" {

  source = "./modules/lambda"

  lambda_name = var.lambda_name

  runtime = var.runtime

  role_arn = aws_iam_role.lambda_role.arn

  filename = data.archive_file.lambda_zip.output_path

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}