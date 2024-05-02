resource "aws_s3_bucket" "s3_bucket_cloudnativeapp" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_cloudnativeapp_oc" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_cloudnativeapp_pab" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket_cloudnativeapp_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_cloudnativeapp_oc,
    aws_s3_bucket_public_access_block.s3_bucket_cloudnativeapp_pab
  ]

  bucket     = aws_s3_bucket.s3_bucket_cloudnativeapp.id
  acl        = "public-read"
}

resource "aws_s3_bucket_policy" "s3_bucket_cloudnativeapp_policy" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp.id
  policy = data.aws_iam_policy_document.iam_policy_document_cloudnativeapp.json
}

