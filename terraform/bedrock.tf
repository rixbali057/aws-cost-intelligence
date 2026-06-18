resource "aws_s3_bucket" "bedrock_docs" {

  bucket = "pk-bedrock-kb-dev"

}

resource "aws_iam_role" "bedrock_kb_role" {

  name = "bedrock-kb-role-dev"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "bedrock.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy" "bedrock_s3_access" {

  name = "bedrock-kb-s3-access"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]

        Resource = [
          aws_s3_bucket.bedrock_docs.arn,
          "${aws_s3_bucket.bedrock_docs.arn}/*"
        ]
      }
    ]
  })
}
resource "aws_iam_role_policy_attachment" "bedrock_attach" {

  role = aws_iam_role.bedrock_kb_role.name

  policy_arn = aws_iam_policy.bedrock_s3_access.arn
}