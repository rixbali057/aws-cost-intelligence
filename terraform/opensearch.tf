
# resource "aws_opensearchserverless_security_policy" "encryption" {

#   name = "bedrock-kb-encryption"

#   type = "encryption"

#   policy = jsonencode({
#     Rules = [
#       {
#         ResourceType = "collection"
#         Resource = [
#           "collection/bedrock-kb-dev"
#         ]
#       }
#     ]

#     AWSOwnedKey = true
#   })
# }

# resource "aws_opensearchserverless_collection" "bedrock_vector" {

#   name = "bedrock-kb-dev"

#   type = "VECTORSEARCH"

#   depends_on = [aws_opensearchserverless_security_policy.encryption
#   ]

# }

# */