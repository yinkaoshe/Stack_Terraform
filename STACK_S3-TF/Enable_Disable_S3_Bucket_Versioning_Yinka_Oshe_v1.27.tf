# main.tf


variable "enable_versioning" {
  description = "Set to true to enable versioning, false to disable versioning"
  type        = bool
  default     = false # Change to true to enable versioning by default
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = "terrabucketq" # Update with the name of your existing bucket

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"
  }
}

