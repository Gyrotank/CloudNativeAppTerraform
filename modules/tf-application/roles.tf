resource "aws_iam_role" "lambda_iam_role" {
  name = var.lambda_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_iam_policy" {
  name        = var.lambda_iam_policy_name
  description = "A policy for lambda"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = [ "sqs:DeleteMessage", "sqs:GetQueueAttributes", "sqs:ReceiveMessage" ]
        Effect    = "Allow"
        Sid       = ""
      },
      {
        Action    = [ "dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem",
          "dynamodb:BatchWriteItem", "dynamodb:BatchGetItem" ]
        Effect    = "Allow"
        Sid       = ""
      },
      {
        Action    = [ "rekognition:DetectLabels" ]
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_iam_policy_attachment" {
  name       = var.lambda_iam_policy_attachment_name
  roles      = [ aws_iam_role.lambda_iam_role.name ]
  policy_arn = aws_iam_policy.lambda_iam_policy.arn
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name = var.ecs_task_execution_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_te_cloudwatch_iam_policy_attachment" {
  name       = var.ecs_te_cloudwatch_iam_policy_attachment_name
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = data.aws_iam_policy.ecs_cloud_watch.arn
}

resource "aws_iam_policy_attachment" "ecs_te_apprunnerservice_iam_policy_attachment" {
  name       = var.ecs_te_apprunnerservice_iam_policy_attachment_name
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = data.aws_iam_policy.ecs_app_runner_service.arn
}

resource "aws_iam_role" "ecs_task_task_role" {
  name = var.ecs_task_task_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_tt_s3_iam_policy_attachment" {
  name       = var.ecs_tt_s3_iam_policy_attachment_name
  roles      = [aws_iam_role.ecs_task_task_role.name]
  policy_arn = data.aws_iam_policy.ecs_s3.arn
}

resource "aws_iam_policy_attachment" "ecs_tt_dynamodb_iam_policy_attachment" {
  name       = var.ecs_tt_dynamodb_iam_policy_attachment_name
  roles      = [aws_iam_role.ecs_task_task_role.name]
  policy_arn = data.aws_iam_policy.ecs_dynamodb.arn
}
