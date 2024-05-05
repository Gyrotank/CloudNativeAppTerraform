resource "aws_s3_bucket" "s3_bucket_cloudnativeapp-tf" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_oc_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_pab_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket_acl_cloudnativeapp-tf" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_oc_cloudnativeapp-tf,
    aws_s3_bucket_public_access_block.s3_bucket_pab_cloudnativeapp-tf
  ]

  bucket     = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  acl        = "public-read"
}

resource "aws_s3_bucket_policy" "s3_bucket_policy_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  policy = data.aws_iam_policy_document.iam_pd_cloudnativeapp-tf.json
}