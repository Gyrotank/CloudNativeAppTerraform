variable "aws_profile" {
  type        = string
  description = "Name of the AWS profile"
  default     = "default"
}

variable "aws_region" {
  type        = string
  description = "Name of the AWS region"
  default     = "us-east-1"
}

variable "availability_zone_a_name" {
  type        = string
  description = "Name of the primary availability zone"
  default     = "eu-west-1"
}

variable "availability_zone_b_name" {
  type        = string
  description = "Name of the secondary availability zone"
  default     = "us-east-1"
}

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

variable "default_subnet_a_id" {
  type        = string
  description = "Subnet ID of the default VPC's default subnet A"
}

variable "default_subnet_b_id" {
  type        = string
  description = "Subnet ID of the default VPC's default subnet B"
}

variable "default_subnet_a_cidr_blocks" {
  type        = string
  description = "List of CIDR blocks of the VPC's default subnet A"
}

variable "default_subnet_b_cidr_blocks" {
  type        = string
  description = "List of CIDR blocks of the VPC's default subnet B"
}
