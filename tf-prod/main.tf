module "environment" {
  source      = "../modules/tf-environment"
  bucket_name = "prod-s3-bucket-cloudnativeapp"
}