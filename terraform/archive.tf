data "archive_file" "lambda_zip" {

  type = "zip"

  source_file = "../scripts/lambda_function.py"

  output_path = "../build/lambda.zip"
}