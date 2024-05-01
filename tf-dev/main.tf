module "environment" {
  source      = "../modules/tf-environment"
  bucket_name = "dev-s3-bucket-cloudnativeapp"
}
