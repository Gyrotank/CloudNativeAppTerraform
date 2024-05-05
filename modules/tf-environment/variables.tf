variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket to create"
  default     = "s3-image-bucket"
}

variable "sns_name" {
  type        = string
  description = "Name of the SNS topic"
  default     = "sns-image-notification-topic"
}

variable "sqs_name" {
  type        = string
  description = "Name of the SQS queue"
  default     = "sqs-queue"
}

variable "dynamodb_table_name" {
  type        = string
  description = "Name of the DynamoDB table"
  default     = "dynamodb_table"
}
