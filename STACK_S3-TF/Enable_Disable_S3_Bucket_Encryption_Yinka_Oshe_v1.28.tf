# main.tf

# provider "aws" {
#   region = "us -east-1" # Update with your desired AWS region
# }

# Define a variable to determine whether encryption should be enabled or disabled
variable "enable_encryption" {
  description = "Set to true to enable encryption, false to disable encryption"
  type        = bool
  default     = false # Change to true to enable encryption by default
}

resource "aws_s3_bucket" "my_bucket88" {
  bucket = "terrabucketq" # Update with the name of your existing bucket

  # Enable or disable encryption based on the value of the variable
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.enable_encryption ? "alias/aws/s3" : ""
        sse_algorithm     = var.enable_encryption ? "aws:kms" : ""
      }
    }
  }
}




