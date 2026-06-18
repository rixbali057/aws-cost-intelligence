# Define the CloudWatch Dashboard
resource "aws_cloudwatch_dashboard" "main" {

  count          = var.enable_monitoring ? 1 : 0
  dashboard_name = "application-performance-dashboard"

  # The dashboard_body requires a valid JSON configuration string
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "InstanceId", "i-0123456789abcdef0"]
          ]
          period  = 300
          stat    = "Average"
          region  = "us-east-1"
          title   = "EC2 Instance CPU Utilization"
          view    = "timeSeries"
          stacked = false
        }
      },
      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [
            ["AWS/Billing", "EstimatedCharges", "Currency", "USD"]
          ]
          period = 86400
          stat   = "Maximum"
          region = "us-east-1"
          title  = "Total Estimated AWS Charges"
          view   = "singleValue"
        }
      }
    ]
  })
}
