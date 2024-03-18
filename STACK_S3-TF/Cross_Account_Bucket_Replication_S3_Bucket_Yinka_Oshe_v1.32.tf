# main.tf

provider "aws" {
  region = "us-east-1" # AWS region for the management account
  alias  = "management"
}

provider "aws" {
  region = "us-east-1" # AWS region for the development account
  alias  = "development"
}

resource "aws_s3_bucket" "source_bucket" {
  provider = aws.management

  bucket = "stack-buck2-oshe" # Source

  # Enable versioning for the source bucket
  versioning {
    enabled = true
  }

  # Enable replication for the source bucket
  replication_configuration {
    role = "arn:aws:iam::905418090912:role/Engineer" 

    rules {
      id     = "ReplicateAllObjects"
      prefix = ""
      status = "Enabled"

      destination {
        bucket        = "arn:aws:s3:::stackbuckoshesep23" 
        storage_class = "STANDARD" 
      }
    }
  }
}
