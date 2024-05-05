resource "aws_sns_topic" "sns_image_notification" {
  name = var.sns_name
}

resource "aws_sns_topic_policy" "sns_image_notification_cloudnativeapp_policy" {
  arn    = aws_sns_topic.sns_image_notification.arn
  policy = data.aws_iam_policy_document.sns_iam_pd_cloudnativeapp-tf.json
}
