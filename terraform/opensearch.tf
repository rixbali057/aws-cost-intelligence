
resource "aws_opensearchserverless_security_policy" "encryption" {

  count = var.enable_ai_lab ? 1 : 0 #Conditional experssion tf

  name = "bedrock-kb-encryption"

  type = "encryption"

  policy = jsonencode({
    Rules = [
      {
        ResourceType = "collection"
        Resource = [
          "collection/bedrock-kb-dev"
        ]
      }
    ]

    AWSOwnedKey = true
  })
}

resource "aws_opensearchserverless_collection" "bedrock_vector" {

  count = var.enable_ai_lab ? 1 : 0

  name = "bedrock-kb-dev"

  type = "VECTORSEARCH"

  depends_on = [aws_opensearchserverless_security_policy.encryption
  ]

}
