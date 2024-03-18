# main.tf


data "aws_s3_bucket_objects" "my_bucket" {
  bucket = "terrabucketq" # Update with the name of your existing bucket
}

output "bucket_object_keys" {
  value = data.aws_s3_bucket_objects.my_bucket.keys
}
