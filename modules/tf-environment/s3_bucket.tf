resource "aws_s3_bucket" "s3_bucket_cloudnativeapp-tf" {
  bucket = var.bucket_name

  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_oc_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_pab_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "s3_bucket_acl_cloudnativeapp-tf" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_oc_cloudnativeapp-tf,
    aws_s3_bucket_public_access_block.s3_bucket_pab_cloudnativeapp-tf
  ]

  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "s3_bucket_policy_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id
  policy = data.aws_iam_policy_document.s3_iam_pd_cloudnativeapp-tf.json
}

resource "aws_s3_bucket_notification" "s3_bucket_notification_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id

  topic {
    topic_arn = aws_sns_topic.sns_image_notification-tf.arn
    events    = [ "s3:ObjectCreated:*" ]
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_ssec_cloudnativeapp-tf" {
  bucket = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.id

  rule {
    bucket_key_enabled = true

    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}