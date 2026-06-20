resource "aws_bedrockagent_knowledge_base" "kb" {

  name     = "bedrock-kb-dev"
  role_arn = aws_iam_role.bedrock_kb_role.arn

  knowledge_base_configuration {

    type = "VECTOR"

    vector_knowledge_base_configuration {

      embedding_model_arn = "arn:aws:bedrock:${var.aws_region}::foundation-model/amazon.titan-embed-text-v2:0"

    }
  }

  storage_configuration {

    type = "OPENSEARCH_SERVERLESS"

    opensearch_serverless_configuration {

      collection_arn    = aws_opensearchserverless_collection.bedrock_vector[0].arn
      vector_index_name = "bedrock-index"

      field_mapping {

        vector_field   = "vector"
        text_field     = "text"
        metadata_field = "metadata"

      }
    }
  }
}

resource "aws_bedrockagent_data_source" "docs" {

  knowledge_base_id = aws_bedrockagent_knowledge_base.kb.id

  name = "s3-documents"

  data_source_configuration {

    type = "S3"

    s3_configuration {

      bucket_arn = aws_s3_bucket.bedrock_docs.arn

    }
  }
}