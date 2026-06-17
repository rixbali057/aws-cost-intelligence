terraform {

  backend "s3" {

    bucket = "pk-terraform-state0987"

    key = "aws-cost-intelligence/dev/terraform.tfstate"

    region = "us-east-1"
  }
}