resource "aws_opensearchserverless_security_policy" "network" {

  count = var.enable_ai_lab ? 1 : 0

  name = "bedrock-kb-network"

  type = "network"

  policy = jsonencode([
    {
      Rules = [
        {
          ResourceType = "collection"
          Resource = [
            "collection/bedrock-kb-dev"
          ]
        }
      ]

      AllowFromPublic = true
    }
  ])
}