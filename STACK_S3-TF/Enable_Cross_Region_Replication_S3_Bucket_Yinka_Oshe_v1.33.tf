# # main.tf

# provider "aws" {
#   region = "us-east-1" # Input source AWS region
#   alias  = "source"
# }

# provider "aws" {
#   region = "us-west-2" # Input destination AWS region
#   alias  = "destination"
# }

# resource "aws_s3_bucket" "source_bucket9" {
#   provider = aws.source

#   bucket = "stackoshebuck39" # Source bucket

#   # Enable versioning for the source bucket
#   versioning {
#     enabled = true
#   }

#   # Enable replication for the source bucket
#   replication_configuration {
#     role = "arn:aws:iam:us-west-2:471112933411:user/stackadmin" # Update with the ARN of the IAM role for replication

#     rules {
#       id     = "ReplicateAllObjects"
#       prefix = "PRE"
#       status = "Enabled"

#       destination {
#         bucket        = "arn:aws:s3:::stackoshebuck49" # ARN of the destination bucket
#         storage_class = "STANDARD" 
#         replica_kms_key_id = "arn:aws:kms:us-west-2:471112933411:key/666555b5-002c-4414-a321-74cd68424723" # ARN of the KMS key in the destination region
#       }

#       source_selection_criteria {
#         sse_kms_encrypted_objects {
#           enabled = "true"
#         }
#       }
      
#       # Optionally, you can specify filters to control which objects are replicated
#       # filter {
#       #   prefix = "PRE/"
#       #   status = "Enabled"
#       # }
#     }
#   }
# }
