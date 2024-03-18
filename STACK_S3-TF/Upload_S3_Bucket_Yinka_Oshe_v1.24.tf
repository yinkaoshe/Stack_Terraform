
# provider "aws" {
#   region = var.AWS_REGION
# access_key = var.AWS_ACCESS_KEY
# secret_key = var.AWS_SECRET_KEY

#  }

# resource "aws_s3_bucket" "my_bucket" {
#   bucket = "terrabucketg"
#   #acl    = "private"
# }

##

# resource "aws_s3_bucket_object" "my_bucket" {
#   bucket = aws_s3_bucket.my_bucket.id
#   key    = "README.md"
#   source = "/c/app/stack_scripts/README.md"
#   #acl    = "private"
# }

# module "s3_file_upload" {
#   source     = "github.com/barneyparker/terraform-aws-s3-file-upload"
#   bucket_id  = aws_s3_bucket.my_bucket.id
#   source_dir = "/c/app/stack_scripts/README.md"
# }

##
# #Upload a singl file to the S3 bucket
# resource "aws_s3_bucket_object" "files" {
#   bucket = aws_s3_bucket.files.id
#   key = "files.txt" #Object key(files.txt)
#   source = "/home/oracle/scripts/practicedir_osh_sep23/backup334/files.txt"
#   etag = filemd5("/home/oracle/scripts/practicedir_osh_sep23/backup334/files.txt")
# }



