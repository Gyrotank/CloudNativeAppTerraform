resource "aws_ecs_cluster" "ecs_cluster" {
  name = "ecs_cluster_cloudnativeapp-tf"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "CloudNativeApp1_TF_Task_Definition_Family"
  network_mode             = "awsvpc"
  memory                   = 3072
  cpu                      = 1024
  requires_compatibilities = [ "FARGATE" ]
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_task_role.arn

  container_definitions = jsonencode([{
    name  = "cloudnativeapp-1"
    image = var.image_uri

    essential = true

    portMappings = [{
      "name": "cloudnativeapp-1-tf-8080-tcp",
      "containerPort": 8080,
      "hostPort": 8080,
      "protocol": "tcp",
      "appProtocol": "http"
    }]

    logConfiguration = {
      "logDriver": "awslogs",
      "options": {
        "awslogs-create-group": "true",
        "awslogs-group": "/ecs/${aws_cloudwatch_log_group.cloudwatch_log_group.name}",
        "awslogs-region": var.region_name,
        "awslogs-stream-prefix": "ecs"
      },
      "secretOptions": []
    }

    environment = [
      {
        "name": "AWS_DEFAULT_REGION",
        "value": var.region_name
      },
      {
        "name": "S3_BUCKET_NAME",
        "value": var.s3_bucket_name
      },
      {
        "name": "DYNAMODB_TABLE_NAME",
        "value": var.dynamodb_name
      }
    ]
  }])
}

resource "aws_ecs_service" "ecs_service" {
  name            = "CloudNativeApp1TFService"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.subnet_ids
    security_groups = [ aws_security_group.ecs_service_security_group.id ]
    assign_public_ip = true
  }

  desired_count = 2

  load_balancer {
    target_group_arn = aws_lb_target_group.lb_target_group.arn
    container_name   = "cloudnativeapp-1"
    container_port   = 8080
  }
}

