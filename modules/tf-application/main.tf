resource "aws_lambda_function" "lambda_function" {
  function_name    = "lambda_cloudnativeapp-tf"
  role             = aws_iam_role.lambda_iam_role.arn
  filename         = data.archive_file.lambda_archive_file_cloudnativeapp-tf.output_path
  runtime          = "python3.12"
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.lambda_archive_file_cloudnativeapp-tf.output_base64sha256

  environment {
    variables = {
      dynamodb_name = var.dynamodb_name
    }
  }
}

resource "aws_lambda_event_source_mapping" "lambda_test_sqs_trigger" {
  event_source_arn = var.sqs_queue_arn
  function_name    = aws_lambda_function.lambda_function.arn
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "CloudnativeappTfCloudwatchLogGroup"
}