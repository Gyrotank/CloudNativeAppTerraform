data "archive_file" "lambda_archive_file_cloudnativeapp-tf" {
  type        = "zip"
  source_file = "lambda/index.py"
  output_path = "lambda_function_payload.zip"
}
