# main.tf


# resource "aws_s3_bucket_object" "delete_objects" {
#   bucket = aws_s3_bucket.my_bucket.bucket

#   # Specify a single dummy object to trigger deletion of all objects in the bucket
#   key    = "dummy-object-to-delete-all-objects"

#   # Del all objects when applying this configuration
#   source = "/dev/null" 
# }
