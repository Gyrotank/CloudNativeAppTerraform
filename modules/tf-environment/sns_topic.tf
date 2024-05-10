resource "aws_sns_topic" "sns_image_notification-tf" {
  name = var.sns_name
  policy = data.aws_iam_policy_document.sns_iam_pd_cloudnativeapp-tf.json
}

resource "aws_sns_topic_policy" "image_notification_policy" {
  arn    = aws_sns_topic.sns_image_notification-tf.arn
  policy = data.aws_iam_policy_document.sns_iam_pd_cloudnativeapp-tf.json
}

data "aws_iam_policy_document" "sns_iam_pd_cloudnativeapp-tf" {
  statement {
    sid     = "AllowPublishNewMessages"
    effect  = "Allow"
    actions = [
      "sns:Publish"
    ]
    resources = [
      "arn:aws:sns:*:*:${var.sns_name}"
    ]
    principals {
      type        = "Service"
      identifiers = [ "s3.amazonaws.com" ]
    }
    condition {
      test     = "ArnLike"
      values   = [ aws_s3_bucket.s3_bucket_cloudnativeapp-tf.arn ]
      variable = "aws:SourceArn"
    }
  }
}
