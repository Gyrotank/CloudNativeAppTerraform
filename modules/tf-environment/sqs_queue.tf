resource "aws_sqs_queue" "sqs_queue_cloudnativeapp-tf" {
  name       = var.sqs_name
  fifo_queue = false
}

resource "aws_sqs_queue_policy" "sqs_queue_cloudnativeapp_policy" {
  queue_url  = aws_sqs_queue.sqs_queue_cloudnativeapp-tf.id
  policy     = data.aws_iam_policy_document.sqs_iam_pd_cloudnativeapp-tf.json
}

