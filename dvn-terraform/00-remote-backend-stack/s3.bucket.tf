resource "aws_s3_bucket" "this" {
  bucket = var.remote_backend.bucket

  tags = {
    Name = var.remote_backend.bucket
  }
}