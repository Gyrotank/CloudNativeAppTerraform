resource "aws_dynamodb_table" "dynamodb_table_cloudnativeapp-tf" {
  name           = "${var.dynamodb_table_name}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LabelValue"
  range_key      = "ImageName"

  attribute {
    name = "LabelValue"
    type = "S"
  }

  attribute {
    name = "ImageName"
    type = "S"
  }
}
