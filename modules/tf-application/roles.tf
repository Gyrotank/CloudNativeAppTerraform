resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role_cloudnativeapp-tf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.lambda_iam_role.name
}

resource "aws_iam_role_policy_attachment" "lambda_basic_sqs_queue_execution_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaSQSQueueExecutionRole"
  role       = aws_iam_role.lambda_iam_role.name
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
        Resource = "*"
      },
      {
        Action    = [ "dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem", "dynamodb:BatchGetItem" ]
        Effect    = "Allow"
        Resource = "*"
      },
      {
        Action    = [ "rekognition:DetectLabels" ]
        Effect    = "Allow"
        Resource = "*"
      },
      {
        Action    = [ "s3:GetObject" ]
        Effect    = "Allow"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_iam_policy_attachment" {
  name       = "lambda_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [ aws_iam_role.lambda_iam_role.name ]
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs_te_role_cloudnativeapp-tf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_te_cloudwatch_iam_policy_attachment" {
  name       = "ecs_te_cloudwatch_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = data.aws_iam_policy.ecs_cloud_watch.arn
}

resource "aws_iam_policy_attachment" "ecs_te_apprunnerservice_iam_policy_attachment" {
  name       = "ecs_te_apprunnerservice_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = data.aws_iam_policy.ecs_app_runner_service.arn
}

resource "aws_iam_role" "ecs_task_task_role" {
  name = "ecs_tt_role_cloudnativeapp-tf"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_tt_s3_iam_policy_attachment" {
  name       = "ecs_tt_s3_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [aws_iam_role.ecs_task_task_role.name]
  policy_arn = data.aws_iam_policy.ecs_s3.arn
}

resource "aws_iam_policy_attachment" "ecs_tt_dynamodb_iam_policy_attachment" {
  name       = "ecs_tt_dynamodb_iam_policy_attachment_cloudnativeapp-tf"
  roles      = [aws_iam_role.ecs_task_task_role.name]
  policy_arn = data.aws_iam_policy.ecs_dynamodb.arn
}
