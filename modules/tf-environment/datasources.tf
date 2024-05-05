data "aws_iam_policy_document" "s3_iam_pd_cloudnativeapp-tf" {
  statement {
    sid       = "AllowECSPermissions"
    effect    = "Allow"
    actions   = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    principals {
      type        = "Service"
      identifiers = [ "ecs-tasks.amazonaws.com" ]
    }
  }

  statement {
    sid       = "AllowLambdaPermissions"
    effect    = "Allow"
    actions   = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    principals {
      type        = "Service"
      identifiers = [ "lambda.amazonaws.com" ]
    }
  }
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
      test     = "ArnEquals"
      values   = [ aws_s3_bucket.s3_bucket_cloudnativeapp-tf.arn ]
      variable = "aws:SourceArn"
    }
  }
}

data "aws_iam_policy_document" "sqs_iam_pd_cloudnativeapp-tf" {
  statement {
    sid     = "AllowSendMessages"
    effect  = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      "arn:aws:sqs:*:*:${var.sqs_name}/*"
    ]
    principals {
      type        = "Service"
      identifiers = [ "sns.amazonaws.com" ]
    }
    condition {
      test     = "ArnEquals"
      values   = [ aws_sns_topic.sns_image_notification-tf.arn ]
      variable = "aws:SourceArn"
    }
  }
}