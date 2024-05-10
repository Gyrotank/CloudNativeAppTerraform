resource "aws_sns_topic_subscription" "sns_image_notification_topic_subscription-tf" {
  topic_arn  = aws_sns_topic.sns_image_notification-tf.arn
  protocol   = "sqs"
  endpoint   = aws_sqs_queue.sqs_queue_cloudnativeapp-tf.arn
}
