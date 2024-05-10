module "environment" {
  source = "../modules/tf-environment"

  bucket_name         = "dev-bucket-cloudnativeapp1glom-tf"
  sns_name            = "dev-image-notification-cloudnativeapp1glom-tf"
  sqs_name            = "dev-queue-cloudnativeapp1glom-tf"
  dynamodb_table_name = "DevCloudNativeApp1Table-tf"
}

module "application" {
  source = "../modules/tf-application"

  vpc_id         = module.environment.default_vpc_id
  region_name    = module.environment.default_region_name
  subnet_ids     = module.environment.default_subnet_ids
  s3_bucket_name = module.environment.s3_bucket_name
  sqs_queue_arn  = module.environment.sqs_queue_arn
  dynamodb_name  = module.environment.dynamodb_name
  image_uri      = "381492307166.dkr.ecr.eu-west-1.amazonaws.com/cloudnativeapp-1:latest"
}
