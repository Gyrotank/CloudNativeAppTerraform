resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role_cloudnativeapp-tf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = [ "sqs:DeleteMessage", "sqs:GetQueueAttributes", "sqs:ReceiveMessage" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
      {
        Action    = [ "dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem", "dynamodb:BatchGetItem" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
      {
        Action    = [ "rekognition:DetectLabels" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_iam_policy" {
  name        = "lambda_iam_policy_cloudnativeapp-tf"
  description = "A policy for lambda"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = [ "sqs:DeleteMessage", "sqs:GetQueueAttributes", "sqs:ReceiveMessage" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
      {
        Action    = [ "dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem", "dynamodb:BatchGetItem" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
      {
        Action    = [ "rekognition:DetectLabels" ]
        Effect    = "Allow"
        Sid       = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_iam_policy_attachment" {
  name       = "lambda_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [aws_iam_role.lambda_iam_role.name]
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
}
