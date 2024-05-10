resource "aws_sqs_queue" "sqs_queue_cloudnativeapp-tf" {
  name       = var.sqs_name
  fifo_queue = false
}

data "aws_iam_policy_document" "sqs_iam_pd_cloudnativeapp-tf" {
  statement {
    sid     = "AllowSendMessages"
    effect  = "Allow"
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      "arn:aws:sqs:*:*:${var.sqs_name}"
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

resource "aws_sqs_queue_policy" "sqs_queue_cloudnativeapp_policy" {
  queue_url  = aws_sqs_queue.sqs_queue_cloudnativeapp-tf.id
  policy     = data.aws_iam_policy_document.sqs_iam_pd_cloudnativeapp-tf.json
}
