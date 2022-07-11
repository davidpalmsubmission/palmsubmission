########################
# Bucket creation
########################
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "tf-state-palm"
}

##########################
# Bucket private access
##########################
resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  acl    = "private"
}

#############################
# Enable bucket versioning
#############################
resource "aws_s3_bucket_versioning" "tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.tf_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

##########################################################
# Dynamo Table - Prevent Simultaneous Writes
##########################################################
resource "aws_dynamodb_table" "terraform-state" {
  name           = "terraform-state"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}