# # main.tf

# provider "aws" {
#   region = "us-east-1" # Update with your desired AWS region
# }

resource "aws_s3_bucket" "my_bucket1" {
  bucket = "stackoshebuck4" # Update with the name of your existing bucket

  logging {
    target_bucket = "terrabucketq" # Update with the name of the bucket where access logs will be stored
    target_prefix = "PRE/"       # Update with the desired prefix for the access logs
  }
}
