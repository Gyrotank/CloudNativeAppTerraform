data "aws_vpc" "default" {
  default = true
}

data "aws_region" "current" {}

data "aws_iam_policy_document" "s3_iam_pd_cloudnativeapp-tf" {
  statement {
    sid       = "AllowECSPermissions"
    effect    = "Allow"
    actions   = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    principals {
      type        = "Service"
      identifiers = [ "ecs-tasks.amazonaws.com" ]
    }
  }

  statement {
    sid       = "AllowLambdaPermissions"
    effect    = "Allow"
    actions   = [
      "s3:GetObject",
      "s3:GetObjectAttributes",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}",
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
    principals {
      type        = "Service"
      identifiers = [ "lambda.amazonaws.com" ]
    }
  }
}
