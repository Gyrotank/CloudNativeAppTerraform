module "environment" {
  source = "../modules/tf-environment"

  bucket_name = "dev-bucket-cloudnativeapp1glom-tf"

  default_subnet_a_id          = "subnet-0e2759092403c537c"
  default_subnet_a_cidr_blocks = "172.31.0.0/20"
  default_subnet_b_id          = "subnet-01da444623a60d536"
  default_subnet_b_cidr_blocks = "172.31.16.0/20"

  availability_zone_a_name = "eu-west-1a"
  availability_zone_b_name = "eu-west-1b"
}

module "application" {
  source = "../modules/tf-application"

  ecs_cluster_name = "dev_ecs_cluster_cloudnativeapp-tf"
  ecs_service_name = "DevCloudNativeApp1TFService"

  vpc_id         = module.environment.default_vpc_id
  region_name    = module.environment.default_region_name
  ami_uri        = "DEV AWS API URI value"
  subnet_ids     = module.environment.default_subnet_ids
  s3_bucket_name = module.environment.s3_bucket_name
  dynamodb_name  = module.environment.dynamodb_name

  ecs_task_execution_role_name                       = "dev_ecs_task_execution_role_cloudnativeapp-tf"
  ecs_te_cloudwatch_iam_policy_attachment_name       = "dev_ecs_te_cloudwatch_iam_policy_attachment_cloudnativeapp-tf"
  ecs_te_apprunnerservice_iam_policy_attachment_name = "dev_ecs_te_apprunnerservice_iam_policy_attachment_cloudnativeapp-tf"

  ecs_task_task_role_name                    = "dev_ecs_task_task_role_cloudnativeapp-tf"
  ecs_tt_s3_iam_policy_attachment_name       = "dev_ecs_tt_amazons3_iam_policy_attachment_cloudnativeapp-tf"
  ecs_tt_dynamodb_iam_policy_attachment_name = "dev_ecs_tt_amazondynamodb_iam_policy_attachment_cloudnativeapp-tf"

  cloudwatch_log_group = "DevCloudnativeappTfCloudwatchLogGroup"

  task_family_name = "Dev_CloudNativeApp1_TF_Task_Definition_Family"
  container_name = "cloudnativeapp-1"
  image_uri = "381492307166.dkr.ecr.eu-west-1.amazonaws.com/cloudnativeapp-1:latest"

  lambda_function_name              = "dev_lambda_cloudnativeapp-tf"
  lambda_iam_role_name              = "dev_lambda_iam_role_cloudnativeapp-tf"
  lambda_iam_policy_name            = "dev_lambda_iam_policy_cloudnativeapp-tf"
  lambda_iam_policy_attachment_name = "dev_lambda_iam_policy_attachment_cloudnativeapp-tf"

  load_balancer_name              = "DevCloudnativeappTfLb"
  load_balancer_target_group_name = "DevCloudnativeappTfLbTg"
}
