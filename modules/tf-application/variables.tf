variable "s3_bucket_name" {
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

variable "ami_url" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "lambda_function_name" {
  type = string
}

variable "lambda_iam_role_name" {
  type = string
}

variable "lambda_iam_policy_name" {
  type = string
}

variable "lambda_iam_policy_attachment_name" {
  type = string
}

variable "load_balancer_name" {
  type = string
}

variable "load_balancer_target_group_name" {
  type = string
}

variable "ecs_task_execution_role_name" {
  type = string
}

variable "ecs_te_cloudwatch_iam_policy_attachment_name" {
  type = string
}

variable "ecs_te_apprunnerservice_iam_policy_attachment_name" {
  type = string
}

variable "ecs_task_task_role_name" {
  type = string
}

variable "ecs_tt_s3_iam_policy_attachment_name" {
  type = string
}

variable "ecs_tt_dynamodb_iam_policy_attachment_name" {
  type = string
}

variable "cloudwatch_log_group" {
  type = string
}

variable "container_name" {
  type = string
}

variable "image_uri" {
  type = string
}

variable "task_family_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}