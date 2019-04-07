terraform {
  backend "s3" {
    bucket = "treythomas.me-tf-state"
    dynamodb_table = "treythomas.me-tf-state-lock"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "treythomas.me-tf-state"
}

resource "aws_dynamodb_table" "tf_state_lock" {
  name = "treythomas.me-tf-state-lock"
  hash_key = "LockID"
  read_capacity = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }
}
