resource "aws_secretsmanager_secret" "demo_secret" {
  name = "pk-demo-secret"

  description = "Demo secret created via Terraform"
}

resource "aws_secretsmanager_secret_version" "demo_secret_value" {

  secret_id = aws_secretsmanager_secret.demo_secret.id

  secret_string = jsonencode({
    username = "pankaj"
    password = "Swapna123"
  })
}