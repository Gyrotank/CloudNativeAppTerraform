ecs_cluster_name = "ecs_cluster_cloudnativeapp-tf"
ecs_service_name = "CloudNativeApp1TFService"

lambda_function_name              = "lambda_cloudnativeapp-tf"
lambda_iam_role_name              = "lambda_iam_role_cloudnativeapp-tf"
lambda_iam_policy_name            = "lambda_iam_policy_cloudnativeapp-tf"
lambda_iam_policy_attachment_name = "lambda_iam_policy_attachment_cloudnativeapp-tf"

load_balancer_name              = "CloudnativeappTfLb"
load_balancer_target_group_name = "CloudnativeappTfLbTg"

ecs_task_execution_role_name                       = "ecs_task_execution_role_cloudnativeapp-tf"
ecs_te_cloudwatch_iam_policy_attachment_name       = "ecs_te_cloudwatch_iam_policy_attachment_cloudnativeapp-tf"
ecs_te_apprunnerservice_iam_policy_attachment_name = "ecs_te_apprunnerservice_iam_policy_attachment_cloudnativeapp-tf"

ecs_task_task_role_name                    = "ecs_task_task_role_cloudnativeapp-tf"
ecs_tt_s3_iam_policy_attachment_name       = "ecs_tt_amazons3_iam_policy_attachment_cloudnativeapp-tf"
ecs_tt_dynamodb_iam_policy_attachment_name = "ecs_tt_amazondynamodb_iam_policy_attachment_cloudnativeapp-tf"

cloudwatch_log_group = "CloudnativeappTfCloudwatchLogGroup"

task_family_name = "CloudNativeApp1_TF_Task_Definition_Family"
container_name   = "cloudnativeapp-1"
image_uri        = "381492307166.dkr.ecr.eu-west-1.amazonaws.com/cloudnativeapp-1:latest"
