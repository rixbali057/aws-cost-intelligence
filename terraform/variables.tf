variable "aws_region" {
  default = "us-east-1"
}

variable "lambda_name" {
  default = "aws-cost-report-dev-tf"
}

variable "iam_role_name" {
  default = "aws-cost-report-dev-role-tf"
}

variable "runtime" {
  default = "python3.13"
}

variable "schedule_expression" {
  default = "rate(5 minutes)"
}

variable "enable_ai_lab" {
  description = "Enable AI Lab resource"
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  default = false
}