resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = "my-remota-state"
}

resource "aws_s3_bucket_versioning" "versioning_remote_state_bucket" {
  bucket = aws_s3_bucket.remote_state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
