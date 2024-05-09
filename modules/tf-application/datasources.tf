data "archive_file" "lambda_archive_file_cloudnativeapp-tf" {
  type        = "zip"
  source_file = "${path.module}/lambda/index.py"
  output_path = "${path.module}/lambda_function_payload.zip"
}

data "aws_iam_policy" "ecs_cloud_watch" {
  name = "CloudWatchLogsFullAccess"
}

data "aws_iam_policy" "ecs_app_runner_service" {
  name = "AWSAppRunnerServicePolicyForECRAccess"
}

data "aws_iam_policy" "ecs_s3" {
  name = "AmazonS3FullAccess"
}

data "aws_iam_policy" "ecs_dynamodb" {
  name = "AmazonDynamoDBFullAccess"
}