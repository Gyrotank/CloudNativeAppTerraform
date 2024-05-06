resource "aws_lambda_function" "lambda_function" {
  function_name    = "lambda_cloudnativeapp-tf"
  role             = aws_iam_role.lambda_iam_role.arn
  filename         = "lambda_function_payload.zip"
  runtime          = "python3.10"
  handler          = "index.lambda_handler"
  source_code_hash = data.archive_file.lambda_archive_file_cloudnativeapp-tf.output_base64sha256
}

