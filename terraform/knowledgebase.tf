resource "aws_s3_object" "emr_doc" {

  bucket = aws_s3_bucket.bedrock_docs.id

  key = "runbook-emr.txt"

  source = "../documents/runbook-emr.txt"

}

resource "aws_s3_object" "glue_doc" {

  bucket = aws_s3_bucket.bedrock_docs.id

  key = "runbook-glue.txt"

  source = "../documents/runbook-glue.txt"
}

resource "aws_s3_object" "terraform_doc" {

  bucket = aws_s3_bucket.bedrock_docs.id

  key = "runbook-terraform.txt"

  source = "../documents/runbook-terraform.txt"
}