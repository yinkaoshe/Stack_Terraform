provider "aws" {
  region = "us-east-1"
access_key = var.AWS_ACCESS_KEY
secret_key = var.AWS_SECRET_KEY

assume_role {
  role_arn = "arn:aws:iam::471112933411:role/Engineer"
}
}



