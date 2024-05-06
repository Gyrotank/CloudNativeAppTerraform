resource "aws_lambda_function" "lambda_function" {
  function_name    = var.lambda_function_name
  role             = aws_iam_role.lambda_iam_role.arn
  filename         = "lambda_function_payload.zip"
  runtime          = "python3.12"
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.lambda_archive_file_cloudnativeapp-tf.output_base64sha256
}

resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = var.cloudwatch_log_group
}