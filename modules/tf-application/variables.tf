variable "s3_bucket_name" {
  type = string
}

variable "sqs_queue_arn" {
  type = string
}

variable "dynamodb_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "region_name" {
  type = string
}

variable "image_uri" {
  type = string
}
