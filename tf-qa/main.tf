module "qa_s3_bucket" {
  source      = "../modules/tf-environment"
  bucket_name = "qa-s3-bucket-cloudnativeapp"
}