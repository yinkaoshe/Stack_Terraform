# # main.tf


resource "aws_s3_bucket" "my_bucket3" {
  bucket = "terrabucketp" # Update with the name of your bucket
  #acl    = "public-read" # Make the bucket contents publicly accessible

  website {
    index_document = "index.html" # Specify the default index document for the website
    error_document = "error.html" # Specify the default error document for the website
  }

  # Optionally, you can specify lifecycle rules to manage object versions
  lifecycle_rule {
    enabled = true
    expiration {
      days = 30 # Update with the desired number of days to retain objects
    }
  }
}

output "website_endpoint" {
  value = aws_s3_bucket.my_bucket3.website_endpoint
}
