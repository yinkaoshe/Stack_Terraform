
# main.tf
 
  provider "aws" {
    region = "ap-south-1" # AWS region
  }

resource "aws_s3_bucket" "my_bucket" {
  bucket = "terrabucketq" # bucket name
  acl    = "private" # access control list (ACL) for the bucket

  # Optionally, you can specify additional configurations such as versioning, encryption, etc.
  
  # Enable versioning for the bucket
  versioning {
    enabled = true
  }
  
  # Enable server-side encryption for the bucket
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}