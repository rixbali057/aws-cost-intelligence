resource "aws_cloudwatch_event_rule" "lambda_schedule" {

  name = "aws-cost-report-dev-schedule"

  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "lambda_target" {

  rule = aws_cloudwatch_event_rule.lambda_schedule.name

  target_id = "CostReportLambda"

  arn = module.lambda.lambda_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {

  statement_id = "AllowExecutionFromEventBridge"

  action = "lambda:InvokeFunction"

  function_name = module.lambda.lambda_name

  principal = "events.amazonaws.com"

  source_arn = aws_cloudwatch_event_rule.lambda_schedule.arn
}