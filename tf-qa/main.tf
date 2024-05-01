module "environment" {
  source      = "../modules/tf-environment"
  bucket_name = "qa-s3-bucket-cloudnativeapp"
}