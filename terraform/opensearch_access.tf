resource "aws_opensearchserverless_access_policy" "bedrock_access" {

  count = var.enable_ai_lab ? 1 : 0

  name = "bedrock-kb-access"

  type = "data"

  policy = jsonencode([
    {
      Rules = [

        {
          ResourceType = "collection"

          Resource = [
            "collection/bedrock-kb-dev"
          ]

          Permission = [
            "aoss:*"
          ]
        },

        {
          ResourceType = "index"

          Resource = [
            "index/bedrock-kb-dev/*"
          ]

          Permission = [
            "aoss:*"
          ]
        }
      ]

      Principal = [
        aws_iam_role.bedrock_kb_role.arn,
        "arn:aws:iam::664418996643:root",
        "arn:aws:iam::664418996643:user/pk-LF-user"
      ]
    }
  ])
}