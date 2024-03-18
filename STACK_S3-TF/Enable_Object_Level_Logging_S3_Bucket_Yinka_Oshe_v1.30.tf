# # main.tf



resource "aws_s3_bucket" "my_bucket2" {
  bucket = "terra-s3-bucket" # Update with the name of your existing bucket
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "ObjectLevelLogging",
        Effect    = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action    = "s3:PutObject",
        Resource  = aws_s3_bucket.my_bucket.arn,
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        },
        # Update with the ARN of the bucket where access logs will be stored
        # and the desired prefix for the access logs
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*",
        Condition = {
          Bool = {
            "aws:SecureTransport" = "true"
          }
        }
      }
    ]
  })
}

